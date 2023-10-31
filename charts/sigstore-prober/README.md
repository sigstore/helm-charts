# sigstore-prober

![Version: 0.0.18](https://img.shields.io/badge/Version-0.0.18-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.6.9](https://img.shields.io/badge/AppVersion-0.6.9-informational?style=flat-square)

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
| spec.image | string | `"ghcr.io/sigstore/scaffolding/prober:v0.6.9@sha256:1b745626f5603698442ed55f4bdeb1a86f2192b603ccc3343750a3b70304ff94"` |  |
| spec.imagePullPolicy | string | `"Always"` |  |
| spec.matchLabels.app | string | `"sigstore-prober"` |  |
| spec.replicaCount | int | `1` |  |
| spec.resources.limits.cpu | string | `"200m"` |  |
| spec.resources.limits.memory | string | `"128Mi"` |  |
| spec.resources.requests.cpu | string | `"50m"` |  |
| spec.resources.requests.memory | string | `"64Mi"` |  |

