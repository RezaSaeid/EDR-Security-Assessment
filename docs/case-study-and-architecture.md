# EDR Security Assessment — Architecture & Synthetic Case Study

> Assessment-design example only. No real EDR product is claimed to have been tested or bypassed.

## Logical architecture and trust boundaries

~~~mermaid
flowchart LR
 subgraph Endpoint
  P[OS events and protected processes] --> S[Sensor / driver]
  S --> A[Agent service]
  A --> Q[Local queue and policy]
 end
 Q --> T[Authenticated transport]
 T --> M[Management server]
 M --> C[Console / analyst]
 M -->|Policy and commands| T
~~~

A real product may use multiple services, drivers, brokers, cloud services and separate telemetry channels.

## Security properties

| Property | Assessment question | Evidence |
|---|---|---|
| Agent integrity | Can untrusted principals alter binaries, config or runtime state? | ACLs, signatures, service protection, audit |
| Service availability | Can the agent be stopped or prevented from starting? | Service configuration, access checks, failure actions |
| Driver protection | Are driver operations and device interfaces restricted? | Signing policy, device ACL, service configuration |
| Telemetry integrity | Can events be dropped, altered, replayed or misattributed? | Sequence IDs, timestamps, integrity checks |
| Channel security | Are server and agent identities authenticated? | TLS validation, client identity, enrollment/rotation |
| Recovery | Are failures detected and recovered? | Health checks, restart policy, gap reporting |

## TLS is not the whole authentication design

A correctly validated TLS handshake protects the channel and normally authenticates the server. It does not, by itself, prove that the connecting endpoint is an authorized agent.

Agent authentication may use mutual TLS, device certificates, signed tokens, enrollment secrets, or application-layer mechanisms. Document server chain/hostname/validity checks; client certificate requirements; enrollment and identity binding; revocation and rotation; token audience, expiry, scope and replay resistance; and post-authentication authorization.

A certificate-validation bypass in a lab is a test configuration or limitation, not proof of a production vulnerability.

## Synthetic case: telemetry continuity

Question: can the server distinguish a quiet endpoint from one that has stopped reporting?

A robust design needs a heartbeat/sequence model, bounded reporting intervals, server-side last-seen state and a gap policy. Correlate endpoint identity, event sequence, endpoint/server timestamps, retry behavior, transport result, server receipt, console visibility and alert latency.

A missing console event does not localize the fault: it may be absent at source, dropped locally, delayed in transport, rejected server-side, or hidden by presentation/filtering.

## Outcome taxonomy

- **Prevented:** action blocked with enforcement evidence.
- **Detected:** security event/alert generated.
- **Observed:** telemetry recorded without a detection claim.
- **Not detected:** expected detection absent under defined test.
- **Not prevented:** action completed under defined conditions.
- **Inconclusive:** evidence cannot distinguish explanations.
- **Not tested:** no execution evidence exists.

Detection, prevention, telemetry and recovery are separate dimensions.

## Assessment record

Record product/version, OS build, policy, privileges, topology, test identifier, exact procedure, timestamps, expected/observed results, raw evidence location, cleanup, and limitations. Preserve original logs and hashes where appropriate. Use authorized isolated systems.

## Quality gates

- [ ] Trust boundaries and identities explicit.
- [ ] TLS server authentication distinguished from agent authentication.
- [ ] Each test has a defined expected observable.
- [ ] Endpoint, transport, server and console evidence correlated.
- [ ] Detection and prevention claims independent.
- [ ] Not-tested and inconclusive remain explicit.

## References

- [Schannel](https://learn.microsoft.com/windows-server/security/tls/tls-ssl-schannel-ssp-overview)
- [MITRE ATT&CK Enterprise Matrix](https://attack.mitre.org/matrices/enterprise/)
