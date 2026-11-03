# EDR Self-Protection Test Matrix

Planning matrix only; no test below is represented as executed. Use benign, reversible simulations in an authorized isolated lab.

| ID | Domain | Safe test idea | Expected evidence | Status |
|---|---|---|---|---|
| EDR-001 | Service health | Observe normal service stop/start through approved admin workflow | State timeline and audit event | Planned |
| EDR-002 | Driver integrity | Compare signed driver inventory before/after a benign update | Version, hash, event evidence | Planned |
| EDR-003 | Tamper controls | Change a policy-protected setting through supported UI | Policy decision and alert context | Planned |
| EDR-004 | Telemetry continuity | Generate a harmless, known event sequence | Host-to-console correlation | Planned |
| EDR-005 | TLS identity | Validate certificate chain and endpoint identity in test environment | Sanitized certificate metadata | Planned |
| EDR-006 | Recovery | Reboot after a supported maintenance action | Agent health and recovery timeline | Planned |

## Outcome vocabulary
Prevented, Detected, Telemetry-only, Not observed, Inconclusive, Not tested.

## Guardrails
Do not disable protection, terminate protected processes, unload drivers, impair communications, or alter production agents unless separately authorized in writing and covered by rollback. Prefer supported administrative workflows and vendor test modes.
