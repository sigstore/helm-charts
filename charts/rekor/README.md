# rekor

![Version: 1.3.8](https://img.shields.io/badge/Version-1.3.8-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.3.0](https://img.shields.io/badge/AppVersion-1.3.0-informational?style=flat-square)

Part of the sigstore project, Rekor is a timestamping server and transparency log for storing signatures, as well as an API based server for validation

**Homepage:** <https://sigstore.dev/>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| The Sigstore Authors |  |  |

## Source Code

* <https://github.com/sigstore/rekor>

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://sigstore.github.io/helm-charts | trillian | 0.2.12 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| backfillredis.enabled | bool | `false` |  |
| backfillredis.endIndex | int | `-1` |  |
| backfillredis.image.pullPolicy | string | `"IfNotPresent"` |  |
| backfillredis.image.registry | string | `"ghcr.io"` |  |
| backfillredis.image.repository | string | `"sigstore/rekor/backfill-redis"` |  |
| backfillredis.image.version | string | `"sha256:04b43cd3f2d8e165adf072fed494c3c784ee345993048c47c8037b20a3fc6efb"` |  |
| backfillredis.name | string | `"backfillredis"` |  |
| backfillredis.rekorAddress | string | `"rekor.rekor-system.svc"` |  |
| backfillredis.resources | object | `{}` |  |
| backfillredis.securityContext.runAsNonRoot | bool | `true` |  |
| backfillredis.securityContext.runAsUser | int | `65533` |  |
| backfillredis.startIndex | int | `-1` |  |
| backfillredis.ttlSecondsAfterFinished | int | `3600` |  |
| createtree.annotations | object | `{}` |  |
| createtree.force | bool | `false` |  |
| createtree.image.pullPolicy | string | `"IfNotPresent"` |  |
| createtree.image.registry | string | `"ghcr.io"` |  |
| createtree.image.repository | string | `"sigstore/scaffolding/createtree"` |  |
| createtree.image.version | string | `"sha256:8e921d028b46d5ad98994d58f79e2724cf84e99e3270f5799fe0f1a6b518bc4e"` |  |
| createtree.name | string | `"createtree"` |  |
| createtree.resources | object | `{}` |  |
| createtree.securityContext.runAsNonRoot | bool | `true` |  |
| createtree.securityContext.runAsUser | int | `65533` |  |
| createtree.serviceAccount.annotations | object | `{}` |  |
| createtree.serviceAccount.create | bool | `true` |  |
| createtree.serviceAccount.name | string | `""` |  |
| createtree.ttlSecondsAfterFinished | int | `3600` |  |
| forceNamespace | string | `""` |  |
| imagePullSecrets | list | `[]` |  |
| initContainerImage.curl.imagePullPolicy | string | `"IfNotPresent"` |  |
| initContainerImage.curl.registry | string | `"docker.io"` |  |
| initContainerImage.curl.repository | string | `"curlimages/curl"` |  |
| initContainerImage.curl.version | string | `"sha256:dca6e1b1c8e7b8b8e7be4e79fc78a858d12fd56245cb31bfa281dbf7c73a6498"` | 7.82.0 |
| namespace.create | bool | `false` |  |
| namespace.name | string | `"rekor-system"` |  |
| redis.args[0] | string | `"--bind"` |  |
| redis.args[1] | string | `"0.0.0.0"` |  |
| redis.args[2] | string | `"--appendonly"` |  |
| redis.args[3] | string | `"yes"` |  |
| redis.enabled | bool | `true` |  |
| redis.hostname | string | `""` |  |
| redis.image.pullPolicy | string | `"IfNotPresent"` |  |
| redis.image.registry | string | `"docker.io"` |  |
| redis.image.repository | string | `"redis"` |  |
| redis.image.version | string | `"sha256:6c42cce2871e8dc5fb3e843ed5c4e7939d312faf5e53ff0ff4ca955a7e0b2b39"` | 6.2.6-alpine3.15 |
| redis.name | string | `"redis"` |  |
| redis.port | int | `6379` |  |
| redis.readinessProbe.exec.command[0] | string | `"/bin/sh"` |  |
| redis.readinessProbe.exec.command[1] | string | `"-i"` |  |
| redis.readinessProbe.exec.command[2] | string | `"-c"` |  |
| redis.readinessProbe.exec.command[3] | string | `"test \"$(redis-cli -h 127.0.0.1 ping)\" = \"PONG\""` |  |
| redis.readinessProbe.failureThreshold | int | `3` |  |
| redis.readinessProbe.initialDelaySeconds | int | `5` |  |
| redis.readinessProbe.periodSeconds | int | `10` |  |
| redis.readinessProbe.successThreshold | int | `1` |  |
| redis.readinessProbe.timeoutSeconds | int | `1` |  |
| redis.replicaCount | int | `1` |  |
| redis.resources | object | `{}` |  |
| redis.service.ports[0].name | string | `"6379-tcp"` |  |
| redis.service.ports[0].port | int | `6379` |  |
| redis.service.ports[0].protocol | string | `"TCP"` |  |
| redis.service.ports[0].targetPort | int | `6379` |  |
| redis.service.type | string | `"ClusterIP"` |  |
| redis.serviceAccount.annotations | object | `{}` |  |
| redis.serviceAccount.create | bool | `true` |  |
| redis.serviceAccount.name | string | `""` |  |
| server.attestation_storage.bucket | string | `"file:///var/run/attestations"` |  |
| server.attestation_storage.enabled | bool | `true` |  |
| server.attestation_storage.persistence.accessModes[0] | string | `"ReadWriteOnce"` |  |
| server.attestation_storage.persistence.annotations | object | `{}` |  |
| server.attestation_storage.persistence.enabled | bool | `true` |  |
| server.attestation_storage.persistence.existingClaim | string | `""` |  |
| server.attestation_storage.persistence.mountPath | string | `"/var/lib/mysql"` |  |
| server.attestation_storage.persistence.size | string | `"5Gi"` |  |
| server.attestation_storage.persistence.storageClass | string | `""` |  |
| server.attestation_storage.persistence.subPath | string | `""` |  |
| server.config.key | string | `"treeID"` |  |
| server.config.treeID | string | `""` |  |
| server.enabled | bool | `true` |  |
| server.extraArgs | list | `[]` |  |
| server.image.pullPolicy | string | `"IfNotPresent"` |  |
| server.image.registry | string | `"gcr.io"` |  |
| server.image.repository | string | `"projectsigstore/rekor-server"` |  |
| server.image.version | string | `"sha256:1cf8618112dd67113a49c93f717488e45c5fc765eb03484870123404d9e9f00c"` |  |
| server.ingress.annotations | object | `{}` |  |
| server.ingress.className | string | `"nginx"` |  |
| server.ingress.enabled | bool | `true` |  |
| server.ingress.hosts[0].host | string | `"root"` |  |
| server.ingress.hosts[0].path | string | `"/"` |  |
| server.ingress.tls | list | `[]` |  |
| server.ingresses[0].annotations | object | `{}` |  |
| server.ingresses[0].backendConfigSpec.logging.enable | bool | `true` |  |
| server.ingresses[0].backendConfigSpec.securityPolicy.name | string | `"rekor-security-policy"` |  |
| server.ingresses[0].className | string | `"gce"` |  |
| server.ingresses[0].enabled | bool | `false` |  |
| server.ingresses[0].frontendConfigSpec.redirectToHttps.enabled | bool | `true` |  |
| server.ingresses[0].frontendConfigSpec.sslPolicy | string | `"rekor-ssl-policy"` |  |
| server.ingresses[0].hosts[0].host | string | `"root"` |  |
| server.ingresses[0].hosts[0].path | string | `"/"` |  |
| server.ingresses[0].name | string | `"gce-ingress"` |  |
| server.ingresses[0].staticGlobalIP | string | `"lb-ext-ip"` |  |
| server.ingresses[0].tls | list | `[]` |  |
| server.livenessProbe.failureThreshold | int | `3` |  |
| server.livenessProbe.httpGet.path | string | `"/ping"` |  |
| server.livenessProbe.httpGet.port | int | `3000` |  |
| server.livenessProbe.initialDelaySeconds | int | `30` |  |
| server.livenessProbe.periodSeconds | int | `10` |  |
| server.livenessProbe.successThreshold | int | `1` |  |
| server.livenessProbe.timeoutSeconds | int | `1` |  |
| server.logging.production | bool | `false` |  |
| server.name | string | `"server"` |  |
| server.podAnnotations."prometheus.io/path" | string | `"/metrics"` |  |
| server.podAnnotations."prometheus.io/port" | string | `"2112"` |  |
| server.podAnnotations."prometheus.io/scrape" | string | `"true"` |  |
| server.port | int | `3000` |  |
| server.readinessProbe.failureThreshold | int | `3` |  |
| server.readinessProbe.httpGet.path | string | `"/ping"` |  |
| server.readinessProbe.httpGet.port | int | `3000` |  |
| server.readinessProbe.initialDelaySeconds | int | `10` |  |
| server.readinessProbe.periodSeconds | int | `10` |  |
| server.readinessProbe.successThreshold | int | `1` |  |
| server.readinessProbe.timeoutSeconds | int | `1` |  |
| server.replicaCount | int | `1` |  |
| server.resources | object | `{}` |  |
| server.retrieve_api.enabled | bool | `true` |  |
| server.securityContext.runAsNonRoot | bool | `true` |  |
| server.securityContext.runAsUser | int | `65533` |  |
| server.service.ports[0].name | string | `"3000-tcp"` |  |
| server.service.ports[0].port | int | `80` |  |
| server.service.ports[0].protocol | string | `"TCP"` |  |
| server.service.ports[0].targetPort | int | `3000` |  |
| server.service.ports[1].name | string | `"2112-tcp"` |  |
| server.service.ports[1].port | int | `2112` |  |
| server.service.ports[1].protocol | string | `"TCP"` |  |
| server.service.ports[1].targetPort | int | `2112` |  |
| server.service.type | string | `"ClusterIP"` |  |
| server.serviceAccount.annotations | object | `{}` |  |
| server.serviceAccount.create | bool | `true` |  |
| server.serviceAccount.name | string | `""` |  |
| server.sharding.contents | string | `""` |  |
| server.sharding.filename | string | `"sharding-config.yaml"` |  |
| server.sharding.mountPath | string | `"/sharding"` |  |
| server.signer | string | `"memory"` |  |
| trillian.adminServer | string | `""` |  |
| trillian.enabled | bool | `true` |  |
| trillian.forceNamespace | string | `"trillian-system"` |  |
| trillian.fullnameOverride | string | `"trillian"` |  |
| trillian.logServer.fullnameOverride | string | `"trillian-logserver"` |  |
| trillian.logServer.name | string | `"trillian-logserver"` |  |
| trillian.logServer.portHTTP | int | `8090` |  |
| trillian.logServer.portRPC | int | `8091` |  |
| trillian.logSigner.fullnameOverride | string | `"trillian-logsigner"` |  |
| trillian.logSigner.name | string | `"trillian-logsigner"` |  |
| trillian.mysql.fullnameOverride | string | `"trillian-mysql"` |  |
| trillian.namespace.create | bool | `true` |  |
| trillian.namespace.name | string | `"trillian-system"` |  |

