# ctlog

![Version: 0.3.0](https://img.shields.io/badge/Version-0.3.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.3.0](https://img.shields.io/badge/AppVersion-0.3.0-informational?style=flat-square)

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
| createctconfig.containerSecurityContext.enabled | bool | `false` |  |
| createctconfig.enabled | bool | `true` |  |
| createctconfig.extraEnvVars | list | `[]` |  |
| createctconfig.extraEnvVarsCM | string | `""` |  |
| createctconfig.extraEnvVarsSecret | string | `""` |  |
| createctconfig.extraVolumeMounts | list | `[]` |  |
| createctconfig.extraVolumes | list | `[]` |  |
| createctconfig.fulcioURL | string | `"http://fulcio-server.fulcio-system.svc"` |  |
| createctconfig.image.imagePullPolicy | string | `"IfNotPresent"` |  |
| createctconfig.image.imagePullSecrets | list | `[]` |  |
| createctconfig.image.registry | string | `"ghcr.io"` |  |
| createctconfig.image.repository | string | `"sigstore/scaffolding/createctconfig"` |  |
| createctconfig.image.version | string | `"sha256:2d8072d832370a8dbbe96536eaf479a5bf3a738c997394c888fed8ddcbe84a1b"` | v0.6.5 |
| createctconfig.initContainers.curl.containerSecurityContext.enabled | bool | `false` |  |
| createctconfig.initContainers.curl.extraEnvVars | list | `[]` |  |
| createctconfig.initContainers.curl.extraEnvVarsCM | string | `""` |  |
| createctconfig.initContainers.curl.extraEnvVarsSecret | string | `""` |  |
| createctconfig.initContainers.curl.extraVolumeMounts | list | `[]` |  |
| createctconfig.initContainers.curl.image.imagePullPolicy | string | `"IfNotPresent"` |  |
| createctconfig.initContainers.curl.image.imagePullSecrets | list | `[]` |  |
| createctconfig.initContainers.curl.image.registry | string | `"docker.io"` |  |
| createctconfig.initContainers.curl.image.repository | string | `"curlimages/curl"` |  |
| createctconfig.initContainers.curl.image.version | string | `"sha256:dca6e1b1c8e7b8b8e7be4e79fc78a858d12fd56245cb31bfa281dbf7c73a6498"` | 7.88.1 |
| createctconfig.initContainers.curl.resources | object | `{}` |  |
| createctconfig.logPrefix | string | `"sigstorescaffolding"` |  |
| createctconfig.name | string | `"createctconfig"` |  |
| createctconfig.nodeSelector | object | `{}` |  |
| createctconfig.podSecurityContext.enabled | bool | `true` |  |
| createctconfig.podSecurityContext.runAsNonRoot | bool | `true` |  |
| createctconfig.podSecurityContext.runAsUser | int | `65533` |  |
| createctconfig.privateKeyPasswordSecretName | string | `""` |  |
| createctconfig.privateSecret | string | `""` |  |
| createctconfig.pubkeysecret | string | `"ctlog-public-key"` |  |
| createctconfig.serviceAccount.annotations | object | `{}` |  |
| createctconfig.serviceAccount.create | bool | `true` |  |
| createctconfig.serviceAccount.mountToken | bool | `true` |  |
| createctconfig.serviceAccount.name | string | `""` |  |
| createctconfig.tolerations | list | `[]` |  |
| createctconfig.ttlSecondsAfterFinished | int | `3600` |  |
| createtree.annotations | object | `{}` |  |
| createtree.containerSecurityContext.enabled | bool | `false` |  |
| createtree.displayName | string | `"ctlog-tree"` |  |
| createtree.enabled | bool | `true` |  |
| createtree.extraEnvVars | list | `[]` |  |
| createtree.extraEnvVarsCM | string | `""` |  |
| createtree.extraEnvVarsSecret | string | `""` |  |
| createtree.extraVolumeMounts | list | `[]` |  |
| createtree.extraVolumes | list | `[]` |  |
| createtree.image.imagePullPolicy | string | `"IfNotPresent"` |  |
| createtree.image.imagePullSecrets | list | `[]` |  |
| createtree.image.registry | string | `"ghcr.io"` |  |
| createtree.image.repository | string | `"sigstore/scaffolding/createtree"` |  |
| createtree.image.version | string | `"sha256:47206322c1d6002ffc737d94852924fae0f749aa3a64c1899eee11f502f609a6"` |  |
| createtree.name | string | `"createtree"` |  |
| createtree.nodeSelector | object | `{}` |  |
| createtree.podSecurityContext.enabled | bool | `true` |  |
| createtree.podSecurityContext.runAsNonRoot | bool | `true` |  |
| createtree.podSecurityContext.runAsUser | int | `65533` |  |
| createtree.serviceAccount.annotations | object | `{}` |  |
| createtree.serviceAccount.create | bool | `true` |  |
| createtree.serviceAccount.mountToken | bool | `true` |  |
| createtree.serviceAccount.name | string | `""` |  |
| createtree.tolerations | list | `[]` |  |
| createtree.ttlSecondsAfterFinished | int | `3600` |  |
| forceNamespace | string | `""` |  |
| global.imagePullSecrets | list | `[]` |  |
| namespace.create | bool | `false` |  |
| namespace.name | string | `"ctlog-system"` |  |
| server.config.key | string | `"treeID"` |  |
| server.config.treeID | string | `""` |  |
| server.containerSecurityContext.enabled | bool | `false` |  |
| server.extraArgs | list | `[]` |  |
| server.extraEnvVars | list | `[]` |  |
| server.extraEnvVarsCM | string | `""` |  |
| server.extraEnvVarsSecret | string | `""` |  |
| server.extraVolumeMounts | list | `[]` |  |
| server.extraVolumes | list | `[]` |  |
| server.image.imagePullPolicy | string | `"IfNotPresent"` |  |
| server.image.imagePullSecrets | list | `[]` |  |
| server.image.registry | string | `"ghcr.io"` |  |
| server.image.repository | string | `"sigstore/scaffolding/ct_server"` |  |
| server.image.version | string | `"sha256:1ef2480cf8ddb1f99da0d931283f3c55babb84d79bf36f66d7bed29985bcca7e"` |  |
| server.ingress | object | `{}` |  |
| server.ingresses | list | `[]` |  |
| server.livenessProbe.httpGet.path | string | `"/healthz"` |  |
| server.livenessProbe.httpGet.port | int | `6962` |  |
| server.livenessProbe.initialDelaySeconds | int | `10` |  |
| server.nodeSelector | object | `{}` |  |
| server.podAnnotations."prometheus.io/path" | string | `"/metrics"` |  |
| server.podAnnotations."prometheus.io/port" | string | `"6963"` |  |
| server.podAnnotations."prometheus.io/scrape" | string | `"true"` |  |
| server.podSecurityContext.enabled | bool | `true` |  |
| server.podSecurityContext.runAsNonRoot | bool | `true` |  |
| server.podSecurityContext.runAsUser | int | `65533` |  |
| server.portHTTP | int | `6962` |  |
| server.portHTTPMetrics | int | `6963` |  |
| server.readinessProbe.httpGet.path | string | `"/healthz"` |  |
| server.readinessProbe.httpGet.port | int | `6962` |  |
| server.readinessProbe.initialDelaySeconds | int | `10` |  |
| server.replicaCount | int | `1` |  |
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
| server.tolerations | list | `[]` |  |
| trillian.logServer.name | string | `"trillian-logserver"` |  |
| trillian.logServer.portRPC | int | `8091` |  |
| trillian.namespace.name | string | `"trillian-system"` |  |
