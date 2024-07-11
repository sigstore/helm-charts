# updatetree

![Version: 0.0.9](https://img.shields.io/badge/Version-0.0.9-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.6.17](https://img.shields.io/badge/AppVersion-0.6.17-informational?style=flat-square)

Update the status of an existing Trillian tree

**Homepage:** <https://sigstore.dev/>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| The Sigstore Authors |  |  |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| annotations | object | `{}` |  |
| args.treeID | string | `""` |  |
| args.treeState | string | `""` | valid tree states are ACTIVE, FROZEN and DRAINING |
| enabled | bool | `false` |  |
| namespace.create | bool | `false` |  |
| namespace.name | string | `"trillian-system"` |  |
| nodeSelector | object | `{}` |  |
| securityContext.runAsNonRoot | bool | `true` |  |
| securityContext.runAsUser | int | `65533` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.create | bool | `false` |  |
| serviceAccount.name | string | `"trillian-logserver"` |  |
| spec.image | string | `"ghcr.io/sigstore/scaffolding/updatetree:v0.6.17@sha256:9fe03dde7324490cc7a84c75dfa3f1de267fc71c1a473fc67491c690e22c32ab"` |  |
| spec.replicaCount | int | `1` |  |
| tolerations | list | `[]` |  |
| trillian.adminServer | string | `""` |  |
| trillian.logServer.name | string | `"trillian-logserver"` |  |
| trillian.logServer.portRPC | int | `8091` |  |
| trillian.namespace | string | `"trillian-system"` |  |
| ttlSecondsAfterFinished | int | `3600` |  |
