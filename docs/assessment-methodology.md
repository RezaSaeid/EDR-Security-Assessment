# EDR Security Assessment Methodology

Assess defensive properties using controlled, reversible tests. Focus on the agent, telemetry, and management channel—not on bypassing protection in real environments.

## Domains

| Domain | Question | Evidence |
|---|---|---|
| Service resilience | Are unexpected service-state changes visible? | State timeline and alert |
| Driver integrity | Are driver load/state changes visible? | Driver inventory and events |
| Tamper resistance | Are authorized changes distinguished from suspicious ones? | Test, policy, event |
| Telemetry integrity | Are gaps, delays, and dropped events observable? | Timestamped event sequence |
| Agent-server authentication | Are peers authenticated as designed? | Sanitized handshake evidence |
| Detection quality | Is useful context attached to alerts? | Alert and process tree |
| Recovery | Does the agent recover after a permitted test? | State timeline |

## Lifecycle
1. Define hypothesis and expected telemetry before execution.
2. Confirm written authorization, scope, rollback, and VM snapshot.
3. Use benign simulations and test-only configurations.
4. Record host and console observations with synchronized timestamps.
5. Compare expected and observed behavior.
6. Classify: Detected, Prevented, Telemetry-only, Not observed, Inconclusive, or Not tested.
7. Clean up and verify agent health.
8. Document limitations.

## Metrics
Detection latency, prevention outcome, telemetry completeness, alert context quality, false-positive/negative caveats, and recovery time.

Results apply only to the recorded product version, policy, and environment. Do not generalize from a small test set.
