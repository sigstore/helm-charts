# sigstore-prober

![Version: 0.0.9](https://img.shields.io/badge/Version-0.0.9-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.4.11](https://img.shields.io/badge/AppVersion-0.4.11-informational?style=flat-square)

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
| spec.image | string | `"ghcr.io/sigstore/scaffolding/prober@sha256:2702227a7d0f40ada3db12f2ec3a2e959950cfc7426a3f129b9be6fb0d3acdec"` |  |
| spec.imagePullPolicy | string | `"Always"` |  |
| spec.matchLabels.app | string | `"sigstore-prober"` |  |
| spec.replicaCount | int | `1` |  |

