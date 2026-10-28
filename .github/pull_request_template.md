## Description
<!-- What is changed and why? -->

## References
- Ticket / issue:
- Approval (if required, e.g. repository request thread):

## Security checklist (author)
Requirements: [Code-Change Integration Guidelines](https://clausmark.atlassian.net/wiki/spaces/CINO/pages/5359534097/Code-Change+Integration+Guidelines) · [APP - Github](https://clausmark.atlassian.net/wiki/spaces/CINO/pages/6417743873/APP+-+Github) · Policies in Vanta: *Security in Projects, Development and Testing*, *Identity and Access Control*

- [ ] No secrets, passwords, API keys or tokens in the change
- [ ] No security measures bypassed or weakened (branch protection, permissions, signing, scans)
- [ ] New third-party components (GitHub Actions, tools, libraries) come from trusted sources, are pinned (commit SHA / fixed version) and approved
- [ ] Workflows use least privilege (`permissions:` set explicitly, secrets only where needed)
- [ ] Automated checks passed (CI, Dependabot, secret scanning)

## Reviewer confirmation
- [ ] I am not the author of this change
- [ ] Change reviewed against the checklist above; findings resolved or tracked in a follow-up issue
- [ ] **Checklist is complete – security requirements are met**
