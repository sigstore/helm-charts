# ctlog

## Quick Installation

```shell
helm install [RELEASE_NAME] .
```

This command deploys the default configuration for the ctlog chart. The [Parameters] section describes the various ways in which the chart can be configured.

## Uninstallation

```shell
helm uninstall [RELEASE_NAME]
```

The previous command removes the previously installed chart.

## Parameters

The following table lists the configurable parameters of the ctlog chart and their default values.

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| createcerts.enabled | bool | `true` |  |
| createcerts.image.pullPolicy | string | `"IfNotPresent"` |  |
| createcerts.image.registry | string | `"ghcr.io"` |  |
| createcerts.image.repository | string | `"sigstore/scaffolding/createcerts"` |  |
| createcerts.image.version | string | `"sha256:6baad7b01770798fcaa4fcdefb96217ce46fae16e33b63ac4f1af1c07b38cf19"` |  |
| createcerts.name | string | `"createcerts"` |  |
| createcerts.replicaCount | int | `1` |  |
| createcerts.serviceAccount.annotations | object | `{}` |  |
| createcerts.serviceAccount.create | bool | `true` |  |
| createcerts.serviceAccount.mountToken | bool | `true` |  |
| createcerts.serviceAccount.name | string | `""` |  |
| createtree.enabled | bool | `true` |  |
| createtree.image.pullPolicy | string | `"IfNotPresent"` |  |
| createtree.image.registry | string | `"ghcr.io"` |  |
| createtree.image.repository | string | `"sigstore/scaffolding/createtree"` |  |
| createtree.image.version | string | `"sha256:de57091f8b846ad7935b1c70af0a45e55af7fed50508bec30a51f41509ae75f1"` |  |
| createtree.name | string | `"createtree"` |  |
| createtree.serviceAccount.annotations | object | `{}` |  |
| createtree.serviceAccount.create | bool | `true` |  |
| createtree.serviceAccount.mountToken | bool | `true` |  |
| createtree.serviceAccount.name | string | `""` |  |
| forceNamespace | string | `""` |  |
| namespace.create | bool | `false` |  |
| namespace.name | string | `"ctlog-system"` |  |
| server.image.pullPolicy | string | `"IfNotPresent"` |  |
| server.image.registry | string | `"ghcr.io"` |  |
| server.image.repository | string | `"sigstore/scaffolding/ct_server"` |  |
| server.image.version | string | `"sha256:b128e676903c8ade1f331ac8e0679c0af440481f20fd2dd6eb1abe59a44074de"` |  |
| server.replicaCount | int | `1` |  |
| server.service.ports[0].name | string | `"80-tcp"` |  |
| server.service.ports[0].port | int | `80` |  |
| server.service.ports[0].protocol | string | `"TCP"` |  |
| server.service.ports[0].targetPort | int | `6962` |  |
| server.service.type | string | `"ClusterIP"` |  |
| server.serviceAccount.annotations | object | `{}` |  |
| server.serviceAccount.create | bool | `true` |  |
| server.serviceAccount.mountToken | bool | `false` |  |
| server.serviceAccount.name | string | `""` |  |
| trillian.logServer.name | string | `"trillian-logserver"` |  |
| trillian.logServer.portRPC | int | `8091` |  |
| trillian.namespace | string | `"trillian-system"` |  |

----------------------------------------------
