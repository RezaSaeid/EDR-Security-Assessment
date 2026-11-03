# EDR Security Assessment

A lab-focused framework for evaluating endpoint security resilience, self-protection, telemetry quality, and management-channel security.

> **Status:** Assessment framework. Product-specific results are published only when reproduced and sanitized. No vendor endorsement or certification is implied.

## Assessment domains
Service availability and recovery, driver integrity, tamper resistance, telemetry continuity, agent-server authentication, detection/prevention behavior, alert quality, and analyst visibility.

## Start here
- [Assessment methodology](docs/assessment-methodology.md)
- [Safe test record](docs/safe-test-record.md)
- [Planned self-protection test matrix](test-cases/test-matrix.md)
- [Machine-readable result schema](schemas/test-result.schema.json)
- [Schema usage notes](schemas/README.md)
- [Test report template](templates/test-report-template.md)

## Measurement principles
Separate prevention, detection, and telemetry. Record expected versus observed events, detection latency, recovery time, product/build/policy, and limitations. Missing telemetry is an observation, not automatically a vulnerability.

## Publication and safety
Use isolated VMs, synthetic data, written authorization, and rollback. Do not publish customer data, internal IPs, credentials, certificates, hostnames, or proprietary detection logic. Keep destructive or availability-impacting tests disabled unless separately approved.
