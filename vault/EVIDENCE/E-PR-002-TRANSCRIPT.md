# E-PR-002 transcript — branch-protection probe (machine record, not prose)

```yaml
record: E-PR-002-TRANSCRIPT
status: RECORDED
```

Ruleset creation (app):
`{"enforcement":"active","id":23876055,"name":"main-gates"}`
Ruleset creation (plan):
`{"enforcement":"active","id":23876098,"name":"main-gates"}`
Rules: PR + 1 approval + dismiss-stale + required check "checks" (app only) + no-FF + no-deletion; bypass = owner role.

Rejection probe (bypass removed, empty commit 9b3ea0e pushed):
`remote: error: GH013: Repository rule violations found for refs/heads/main.`
`remote: - Changes must be made through a pull request.`
`remote: - Required status check "checks" is expected.`
Probe reset locally (`git reset --hard HEAD~1`); HEAD back at 4d11ed6; bypass restored; no residue.

Owner-bypass push confirmation (E-PR-002 commit push):
`remote: Bypassed rule violations for refs/heads/main:`
`remote: - Changes must be made through a pull request.`
