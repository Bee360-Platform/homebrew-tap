#!/usr/bin/env bash
# Security checks for the bee360 casks (run in CI on every PR and push to main).
# 1. Download URL must point to our own release repository (allowlist).
# 2. No stanzas that execute code on the user's machine (pre/postflight, installer, scripts …).
# 3. Version/SHA256 well-formed; SHA256 must match the digest of the GitHub release asset.
set -euo pipefail

REPO="Bee360-Platform/bee360-app"
URL_RE='^[[:space:]]+url[[:space:]]+"https://github\.com/Bee360-Platform/bee360-app/releases/download/v#\{version\}/Bee360-app_#\{version\}\.dmg"$'
FORBIDDEN_RE='^[[:space:]]*(preflight|postflight|uninstall_preflight|uninstall_postflight|installer|pkg|script|system_command|caveats)\b|`|%x[\(\{\[]|\b(system|exec|spawn|IO\.popen|Kernel\.)\b'

fail=0
err() { echo "::error file=$1::$2"; fail=1; }

shopt -s nullglob
casks=(Casks/*.rb)
[ ${#casks[@]} -gt 0 ] || { echo "::error::No casks found"; exit 1; }

for f in "${casks[@]}"; do
  echo "== ${f}"

  # 1) URL allowlist: exactly one url stanza, matching our release repo
  n_url=$(grep -cE '^[[:space:]]*url[[:space:]]+"' "$f" || true)
  [ "$n_url" -eq 1 ] || err "$f" "expected exactly one url stanza, found ${n_url}"
  grep -qE "$URL_RE" "$f" || err "$f" "url does not point to ${REPO} releases (allowlist)"

  # 2) No code execution on the user's machine
  if grep -nE "$FORBIDDEN_RE" "$f"; then
    err "$f" "forbidden stanza or code execution construct (see lines above)"
  fi

  # 3) Version and SHA256 format
  version=$(sed -nE 's/^  version "([^"]+)"$/\1/p' "$f")
  sha=$(sed -nE 's/^  sha256 "([^"]+)"$/\1/p' "$f")
  [[ "$version" =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]] || err "$f" "invalid version '${version}'"
  [[ "$sha" =~ ^[0-9a-f]{64}$ ]] || err "$f" "invalid sha256"

  # 3b) SHA256 must match the GitHub release asset (API digest, fallback: download and hash)
  if [[ "$version" =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]] && [[ "$sha" =~ ^[0-9a-f]{64}$ ]]; then
    asset="Bee360-app_${version}.dmg"
    info=$(gh api "repos/${REPO}/releases/tags/v${version}" \
      --jq ".assets[] | select(.name==\"${asset}\") | [.digest // \"\", .browser_download_url] | @tsv" 2>/dev/null || true)
    if [ -z "$info" ]; then
      err "$f" "release v${version} or asset ${asset} not found in ${REPO}"
    else
      digest=$(cut -f1 <<<"$info"); dl=$(cut -f2 <<<"$info")
      if [ -n "$digest" ]; then
        actual="${digest#sha256:}"
      else
        actual=$(curl -fsSL "$dl" | sha256sum | cut -d' ' -f1)
      fi
      if [ "$actual" != "$sha" ]; then
        err "$f" "sha256 does not match the release asset (${actual})"
      else
        echo "sha256 matches release asset"
      fi
    fi
  fi
done

exit "$fail"
