# sigstore-prober
This Helm chart installs a sigstore prober which sends read requests to Rekor and Fulcio APIs.
Latency and response code are tracked for each endpoint.
The metrics can be scraped via Prometheus.


![Version: 0.2.14](https://img.shields.io/badge/Version-0.2.14-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square)

Sigstore API Endpoint Prober

**Homepage:** <https://sigstore.dev/>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| The Sigstore Authors |  |  |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| namespace.create | bool | `true` |  |
| namespace.name | string | `"sigstore-prober"` |  |
| prometheus.port | int | `8080` |  |
| spec.args.frequency | int | `10` |  |
| spec.args.fulcioHost | string | `"https://fulcio.sigstore.dev"` |  |
| spec.args.rekorHost | string | `"https://rekor.sigstore.dev"` |  |
| spec.image | string | `"gcr.io/priya-chainguard/prober-37ee855f344691c13c5769b1675cc9e0@sha256:a601f7de3c572bb65b2cebd431ee8fc0cbd409b2edb5836718f09973400538c8"` |  |
| spec.imagePullPolicy | string | `"Always"` |  |
| spec.matchLabels.app | string | `"sigstore-prober"` |  |
| spec.replicaCount | int | `1` |  |
| spec.serviceAccountName | string | `"default"` |  |

