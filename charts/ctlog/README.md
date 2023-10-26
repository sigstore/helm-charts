# ctlog

![Version: 0.2.47](https://img.shields.io/badge/Version-0.2.47-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.6.9](https://img.shields.io/badge/AppVersion-0.6.9-informational?style=flat-square)

Certificate Log

**Homepage:** <https://sigstore.dev/>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| The Sigstore Authors |  |  |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| createctconfig.annotations | object | `{}` |  |
| createctconfig.backoffLimit | int | `6` |  |
| createctconfig.enabled | bool | `true` |  |
| createctconfig.fulcioURL | string | `"http://fulcio-server.fulcio-system.svc"` |  |
| createctconfig.image.pullPolicy | string | `"IfNotPresent"` |  |
| createctconfig.image.registry | string | `"ghcr.io"` |  |
| createctconfig.image.repository | string | `"sigstore/scaffolding/createctconfig"` |  |
| createctconfig.image.version | string | `"sha256:7a045f84363ca16aa2f4e68db30590fd700e7e3b3b7179bc5a43ffc742d119ba"` | v0.6.9 |
| createctconfig.initContainerImage.curl.imagePullPolicy | string | `"IfNotPresent"` |  |
| createctconfig.initContainerImage.curl.registry | string | `"docker.io"` |  |
| createctconfig.initContainerImage.curl.repository | string | `"curlimages/curl"` |  |
| createctconfig.initContainerImage.curl.version | string | `"sha256:4a3396ae573c44932d06ba33f8696db4429c419da87cbdc82965ee96a37dd0af"` | 8.4.0 |
| createctconfig.logPrefix | string | `"sigstorescaffolding"` |  |
| createctconfig.name | string | `"createctconfig"` |  |
| createctconfig.privateKeyPasswordSecretName | string | `""` |  |
| createctconfig.privateSecret | string | `""` |  |
| createctconfig.pubkeysecret | string | `"ctlog-public-key"` |  |
| createctconfig.replicaCount | int | `1` |  |
| createctconfig.securityContext.runAsNonRoot | bool | `true` |  |
| createctconfig.securityContext.runAsUser | int | `65533` |  |
| createctconfig.serviceAccount.annotations | object | `{}` |  |
| createctconfig.serviceAccount.create | bool | `true` |  |
| createctconfig.serviceAccount.mountToken | bool | `true` |  |
| createctconfig.serviceAccount.name | string | `""` |  |
| createctconfig.ttlSecondsAfterFinished | int | `3600` |  |
| createtree.annotations | object | `{}` |  |
| createtree.displayName | string | `"ctlog-tree"` |  |
| createtree.enabled | bool | `true` |  |
| createtree.image.pullPolicy | string | `"IfNotPresent"` |  |
| createtree.image.registry | string | `"ghcr.io"` |  |
| createtree.image.repository | string | `"sigstore/scaffolding/createtree"` |  |
| createtree.image.version | string | `"sha256:acd6f2bc2ad9bac400f86fc08d7c1042e0727fe6d0360a36b958ca25208d627a"` |  |
| createtree.name | string | `"createtree"` |  |
| createtree.securityContext.runAsNonRoot | bool | `true` |  |
| createtree.securityContext.runAsUser | int | `65533` |  |
| createtree.serviceAccount.annotations | object | `{}` |  |
| createtree.serviceAccount.create | bool | `true` |  |
| createtree.serviceAccount.mountToken | bool | `true` |  |
| createtree.serviceAccount.name | string | `""` |  |
| createtree.ttlSecondsAfterFinished | int | `3600` |  |
| forceNamespace | string | `""` |  |
| namespace.create | bool | `false` |  |
| namespace.name | string | `"ctlog-system"` |  |
| server.config.key | string | `"treeID"` |  |
| server.config.treeID | string | `""` |  |
| server.extraArgs | list | `[]` |  |
| server.image.pullPolicy | string | `"IfNotPresent"` |  |
| server.image.registry | string | `"ghcr.io"` |  |
| server.image.repository | string | `"sigstore/scaffolding/ct_server"` |  |
| server.image.version | string | `"sha256:e1e93f11c8bde87d7160891bd409020d1941972b61ec356f671af1e4f7261ac8"` |  |
| server.ingress.annotations | object | `{}` |  |
| server.ingress.className | string | `"nginx"` |  |
| server.ingress.enabled | bool | `false` |  |
| server.ingress.hosts[0].path | string | `"/"` |  |
| server.ingress.tls | list | `[]` |  |
| server.ingresses[0].annotations | object | `{}` |  |
| server.ingresses[0].className | string | `"gce"` |  |
| server.ingresses[0].enabled | bool | `false` |  |
| server.ingresses[0].frontendConfigSpec.redirectToHttps.enabled | bool | `true` |  |
| server.ingresses[0].frontendConfigSpec.sslPolicy | string | `"ctlog-ssl-policy"` |  |
| server.ingresses[0].hosts[0].host | string | `"fulcio.localhost"` |  |
| server.ingresses[0].hosts[0].paths[0].path | string | `"/test"` |  |
| server.ingresses[0].hosts[0].paths[0].pathType | string | `"Prefix"` |  |
| server.ingresses[0].hosts[0].paths[1].path | string | `"/other-shard"` |  |
| server.ingresses[0].hosts[0].paths[1].serviceName | string | `"other-shard"` |  |
| server.ingresses[0].name | string | `"gce-ingress"` |  |
| server.ingresses[0].staticGlobalIP | string | `"lb-ext-ip"` |  |
| server.ingresses[0].tls | list | `[]` |  |
| server.livenessProbe.httpGet.path | string | `"/healthz"` |  |
| server.livenessProbe.httpGet.port | int | `6962` |  |
| server.livenessProbe.initialDelaySeconds | int | `10` |  |
| server.podAnnotations."prometheus.io/path" | string | `"/metrics"` |  |
| server.podAnnotations."prometheus.io/port" | string | `"6963"` |  |
| server.podAnnotations."prometheus.io/scrape" | string | `"true"` |  |
| server.portHTTP | int | `6962` |  |
| server.portHTTPMetrics | int | `6963` |  |
| server.readinessProbe.httpGet.path | string | `"/healthz"` |  |
| server.readinessProbe.httpGet.port | int | `6962` |  |
| server.readinessProbe.initialDelaySeconds | int | `10` |  |
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

