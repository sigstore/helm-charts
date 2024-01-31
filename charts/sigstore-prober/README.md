# sigstore-prober

![Version: 0.0.21](https://img.shields.io/badge/Version-0.0.21-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.6.16](https://img.shields.io/badge/AppVersion-0.6.16-informational?style=flat-square)

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
| serviceAccount.create | bool | `false` |  |
| serviceAccount.name | string | `"default"` |  |
| spec.args.frequency | int | `10` |  |
| spec.args.fulcioHost | string | `"https://fulcio.sigstore.dev"` |  |
| spec.args.fulcioRequests | list | `[]` |  |
| spec.args.rekorHost | string | `"https://rekor.sigstore.dev"` |  |
| spec.args.rekorRequests | list | `[]` |  |
| spec.args.trustRekorAPIPublicKey | bool | `false` |  |
| spec.args.writeProber | bool | `false` |  |
| spec.image | string | `"ghcr.io/sigstore/scaffolding/prober:v0.6.12@sha256:379bf42e29d614e0dc4a169615c43a7be80b1c2e3c9ff0fcd5e2af8783acd5a3"` |  |
| spec.imagePullPolicy | string | `"Always"` |  |
| spec.matchLabels.app | string | `"sigstore-prober"` |  |
| spec.replicaCount | int | `1` |  |
| spec.resources.limits.cpu | string | `"200m"` |  |
| spec.resources.limits.memory | string | `"128Mi"` |  |
| spec.resources.requests.cpu | string | `"50m"` |  |
| spec.resources.requests.memory | string | `"64Mi"` |  |

