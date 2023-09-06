# updatetree

![Version: 0.0.5](https://img.shields.io/badge/Version-0.0.5-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.6.7](https://img.shields.io/badge/AppVersion-0.6.7-informational?style=flat-square)

Update the status of an existing Trillian tree

**Homepage:** <https://sigstore.dev/>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| The Sigstore Authors |  |  |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| annotations | object | `{}` |  |
| args.treeID | string | `""` |  |
| args.treeState | string | `""` | valid tree states are ACTIVE, FROZEN and DRAINING |
| enabled | bool | `false` |  |
| namespace.create | bool | `false` |  |
| namespace.name | string | `"trillian-system"` |  |
| securityContext.runAsNonRoot | bool | `true` |  |
| securityContext.runAsUser | int | `65533` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.create | bool | `false` |  |
| serviceAccount.name | string | `"trillian-logserver"` |  |
| spec.image | string | `"ghcr.io/sigstore/scaffolding/updatetree:v0.6.7@sha256:357cf3545cd459634fe6a461a7690bc5f425c353e48c80da551cfec6887d627d"` |  |
| spec.replicaCount | int | `1` |  |
| trillian.adminServer | string | `""` |  |
| trillian.logServer.name | string | `"trillian-logserver"` |  |
| trillian.logServer.portRPC | int | `8091` |  |
| trillian.namespace | string | `"trillian-system"` |  |
| ttlSecondsAfterFinished | int | `3600` |  |

