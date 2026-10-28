## Description
<!-- What is changed and why? -->

## References
<!-- Public repository: reference internal tickets and approvals by key only (e.g. TWE-523).
     No internal URLs, hostnames, chat/channel names or personal data. -->
- Ticket / issue:
- Approval (if required, e.g. repository request):

## Security checklist (author)
Requirements: *Code-Change Integration Guidelines* and *APP - Github* (internal Confluence) · Policies in Vanta: *Security in Projects, Development and Testing*, *Identity and Access Control*

- [ ] No secrets, passwords, API keys or tokens in the change
- [ ] No internal URLs, hostnames or personal data in code, commits or this description
- [ ] No security measures bypassed or weakened (branch protection, permissions, signing, scans)
- [ ] New third-party components (GitHub Actions, tools, libraries) come from trusted sources, are pinned (commit SHA / fixed version) and approved
- [ ] Workflows use least privilege (`permissions:` set explicitly, secrets only where needed)
- [ ] Automated checks passed (CI, Dependabot, secret scanning)

## Reviewer confirmation
- [ ] I am not the author of this change
- [ ] Change reviewed against the checklist above; findings resolved or tracked in a follow-up issue
- [ ] **Checklist is complete – security requirements are met**
