# EDR Security Assessment — Technical Framework

## Objective
Evaluate endpoint-agent and management-channel security properties using authorized, controlled, reversible tests. Results apply only to the recorded product version, policy, OS, and lab configuration.

## System model
Document user-mode processes/services; kernel drivers and signing/loading model; local configuration and policy stores; update components; management server and enrollment identity; transport security and certificate validation; event path from sensor through local queue, transport, ingestion, normalization, and console; and local logs. Draw trust boundaries and label identity, privilege, protocol, and data type. Sanitize internal infrastructure before publication.

## Security properties
| Property | Question | Evidence |
|---|---|---|
| Agent integrity | Are unauthorized component changes prevented/detected? | Component identity, policy decision, event |
| Service resilience | Are unexpected state changes visible and recoverable? | Timeline, audit event, health |
| Driver integrity | Are driver identity/state changes observable? | Signed inventory, version/hash, event |
| Tamper resistance | Are protected settings enforced? | Before/after state, policy response |
| Telemetry integrity | Are loss, delay, duplication, reordering observable? | Endpoint/server event sequence |
| Peer authentication | Is intended peer identity validated? | Sanitized certificate/handshake metadata |
| Alert quality | Is investigation context preserved? | Alert fields, process tree, correlation |
| Recovery | Does agent return to healthy state? | Health and recovery timeline |

## Separate outcome dimensions
Prevention, detection, telemetry, response, and recovery are distinct. An alert does not prove prevention. An endpoint log does not prove server ingestion. A missing console alert does not prove that no local event was generated.

## Management-channel authentication
Review server certificate chain validation and hostname/identity matching; trust anchors and certificate lifecycle; mutual TLS or application-level agent authentication; client credential storage; enrollment, renewal, revocation, and re-registration; protocol/cipher negotiation; replay resistance; and identity binding to application messages. A successful TLS handshake proves a session was established under the observed configuration, not necessarily that the intended server or agent identity was authenticated at the application layer.

Never publish private keys, tokens, sensitive certificate identity, or internal endpoints.

## Telemetry pipeline
Trace a benign event through endpoint generation, sensor collection, local buffering/serialization, transport/acknowledgment, server ingestion, normalization/correlation, and console display. Use synthetic correlation IDs and synchronized clocks where possible. Measure loss, duplication, delay, ordering, and field preservation. Record clock skew and buffering as confounders.

## Test design
Each record defines hypothesis, expected result, authorization/scope, excluded actions, product version/policy/OS/topology, preconditions, rollback, expected endpoint/server evidence, actual result/timestamps, classification, confidence, cleanup, and post-test health. Prefer supported administrative workflows and benign simulations. Destructive actions, disabling protection, unloading drivers, terminating protected processes, or impairing communications require separate written authorization and rollback.

## Metrics
Detection latency; delivery latency; telemetry completeness; alert context quality; recovery time; false-positive/negative caveats only when ground truth is defensible. Do not claim statistical confidence from a small trial set.

## Result taxonomy and publication
Use Prevented, Detected, Telemetry-only, Not observed, Inconclusive, and Not tested. Publish sanitized method, expected/observed evidence, limitations, and product/version scope. A framework or planned matrix is not evidence of product effectiveness. Never publish customer telemetry, credentials, proprietary detection logic, or unredacted logs.