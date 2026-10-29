# bee360 Homebrew Tap

```
brew install --cask bee360-platform/tap/bee360            # Stable
brew install --cask bee360-platform/tap/bee360@preview    # Preview
```

- Always use the **full name** (`bee360-platform/tap/…`). Homebrew 6 then trusts exactly this cask; `brew tap` plus the short name is refused for third-party taps.
- **Without admin rights** (standard user), install into your own Applications folder:

  ```
  brew install --cask --appdir=~/Applications bee360-platform/tap/bee360
  ```

  To make this the default, add `export HOMEBREW_CASK_OPTS="--appdir=~/Applications"` to `~/.zprofile`.
- `bee360` and `bee360@preview` cannot be installed at the same time; uninstall one before installing the other.

Casks are updated automatically on every release of
https://github.com/Bee360-Platform/bee360-app.

## Support

Issues are disabled in this repository. For questions or problems with the app or the installation, please contact Bee360 support as described in the Support Guide: https://www.bee360.com/legal-documents

## Security

Please report vulnerabilities privately – see [SECURITY.md](SECURITY.md).
