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
| createctconfig.backoffLimit | int | `6` |  |
| createctconfig.enabled | bool | `true` |  |
| createctconfig.fulcioURL | string | `"http://fulcio-server.fulcio-system.svc"` |  |
| createctconfig.image.pullPolicy | string | `"IfNotPresent"` |  |
| createctconfig.image.registry | string | `"ghcr.io"` |  |
| createctconfig.image.repository | string | `"sigstore/scaffolding/createctconfig"` |  |
| createctconfig.image.version | string | `"sha256:7412243415a984b697a630b2f0b322a519285abc5c458053790e4e5f9a4156b2"` |  |
| createctconfig.name | string | `"createctconfig"` |  |
| createctconfig.replicaCount | int | `1` |  |
| createctconfig.securityContext.runAsNonRoot | bool | `true` |  |
| createctconfig.securityContext.runAsUser | int | `65533` |  |
| createctconfig.serviceAccount.annotations | object | `{}` |  |
| createctconfig.serviceAccount.create | bool | `true` |  |
| createctconfig.serviceAccount.mountToken | bool | `true` |  |
| createctconfig.serviceAccount.name | string | `""` |  |
| createtree.enabled | bool | `true` |  |
| createtree.image.pullPolicy | string | `"IfNotPresent"` |  |
| createtree.image.registry | string | `"ghcr.io"` |  |
| createtree.image.repository | string | `"sigstore/scaffolding/createtree"` |  |
| createtree.image.version | string | `"sha256:b8bbd91bafb1312719ae0d1a59c1deec3c90e74d5f91a16c419841f786b8fc96"` |  |
| createtree.name | string | `"createtree"` |  |
| createtree.securityContext.runAsNonRoot | bool | `true` |  |
| createtree.securityContext.runAsUser | int | `65533` |  |
| createtree.serviceAccount.annotations | object | `{}` |  |
| createtree.serviceAccount.create | bool | `true` |  |
| createtree.serviceAccount.mountToken | bool | `true` |  |
| createtree.serviceAccount.name | string | `""` |  |
| forceNamespace | string | `""` |  |
| namespace.create | bool | `false` |  |
| namespace.name | string | `"ctlog-system"` |  |
| server.config.secret.enabled | bool | `false` |  |
| server.config.secret.name | string | `"ctlog-config"` |  |
| server.extraArgs | list | `[]` |  |
| server.image.pullPolicy | string | `"IfNotPresent"` |  |
| server.image.registry | string | `"ghcr.io"` |  |
| server.image.repository | string | `"sigstore/scaffolding/ct_server"` |  |
| server.image.version | string | `"sha256:6f5ec5dbff8f886b3b56ff206b8e836fe564bbd64a1436ac8c5e7ae341163e24"` |  |
| server.ingress.annotations | object | `{}` |  |
| server.ingress.className | string | `"nginx"` |  |
| server.ingress.enabled | bool | `false` |  |
| server.ingress.hosts[0].path | string | `"/"` |  |
| server.ingress.tls | list | `[]` |  |
| server.podAnnotations."prometheus.io/path" | string | `"/metrics"` |  |
| server.podAnnotations."prometheus.io/port" | string | `"6963"` |  |
| server.podAnnotations."prometheus.io/scrape" | string | `"true"` |  |
| server.portHTTP | int | `6962` |  |
| server.portHTTPMetrics | int | `6963` |  |
| server.replicaCount | int | `1` |  |
| server.securityContext.runAsNonRoot | bool | `true` |  |
| server.securityContext.runAsUser | int | `65533` |  |
| server.service.ports[0].name | string | `"6962-tcp"` |  |
| server.service.ports[0].port | int | `80` |  |
| server.service.ports[0].protocol | string | `"TCP"` |  |
| server.service.ports[0].targetPort | int | `6962` |  |
| server.service.ports[1].name | string | `"6963-tcp"` |  |
| server.service.ports[1].port | int | `6963` |  |
| server.service.ports[1].protocol | string | `"TCP"` |  |
| server.service.ports[1].targetPort | int | `6963` |  |
| server.service.type | string | `"ClusterIP"` |  |
| server.serviceAccount.annotations | object | `{}` |  |
| server.serviceAccount.create | bool | `true` |  |
| server.serviceAccount.mountToken | bool | `false` |  |
| server.serviceAccount.name | string | `""` |  |
| trillian.logServer.name | string | `"trillian-logserver"` |  |
| trillian.logServer.portRPC | int | `8091` |  |
| trillian.namespace | string | `"trillian-system"` |  |

----------------------------------------------
