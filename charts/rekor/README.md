# rekor

![Version: 1.6.1](https://img.shields.io/badge/Version-1.6.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.3.8](https://img.shields.io/badge/AppVersion-1.3.8-informational?style=flat-square)

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
| https://sigstore.github.io/helm-charts | trillian | 0.3.0 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| backfillredis.affinity | object | `{}` |  |
| backfillredis.enabled | bool | `false` |  |
| backfillredis.endIndex | int | `-1` |  |
| backfillredis.image.pullPolicy | string | `"IfNotPresent"` |  |
| backfillredis.image.registry | string | `"ghcr.io"` |  |
| backfillredis.image.repository | string | `"sigstore/rekor/backfill-redis"` |  |
| backfillredis.image.version | string | `"sha256:a13cd8b2a554d6116888fd1f383cf6e91fc1716df5eda392b82e6bfc66995ec3"` |  |
| backfillredis.name | string | `"backfillredis"` |  |
| backfillredis.nodeSelector | object | `{}` |  |
| backfillredis.rekorAddress | string | `"rekor.rekor-system.svc"` |  |
| backfillredis.resources | object | `{}` |  |
| backfillredis.securityContext.runAsNonRoot | bool | `true` |  |
| backfillredis.securityContext.runAsUser | int | `65533` |  |
| backfillredis.startIndex | int | `-1` |  |
| backfillredis.tolerations | list | `[]` |  |
| backfillredis.ttlSecondsAfterFinished | int | `3600` |  |
| createtree.affinity | object | `{}` |  |
| createtree.annotations | object | `{}` |  |
| createtree.force | bool | `false` |  |
| createtree.image.pullPolicy | string | `"IfNotPresent"` |  |
| createtree.image.registry | string | `"ghcr.io"` |  |
| createtree.image.repository | string | `"sigstore/scaffolding/createtree"` |  |
| createtree.image.version | string | `"sha256:c950d5bd0375d07e719e02345c73592b9633606a6b2ad0215baae687a2151923"` |  |
| createtree.name | string | `"createtree"` |  |
| createtree.nodeSelector | object | `{}` |  |
| createtree.resources | object | `{}` |  |
| createtree.securityContext.runAsNonRoot | bool | `true` |  |
| createtree.securityContext.runAsUser | int | `65533` |  |
| createtree.serviceAccount.annotations | object | `{}` |  |
| createtree.serviceAccount.create | bool | `true` |  |
| createtree.serviceAccount.name | string | `""` |  |
| createtree.tolerations | list | `[]` |  |
| createtree.ttlSecondsAfterFinished | int | `3600` |  |
| forceNamespace | string | `""` |  |
| imagePullSecrets | list | `[]` |  |
| initContainerImage.curl.imagePullPolicy | string | `"IfNotPresent"` |  |
| initContainerImage.curl.registry | string | `"docker.io"` |  |
| initContainerImage.curl.repository | string | `"curlimages/curl"` |  |
| initContainerImage.curl.version | string | `"sha256:c1fe1679c34d9784c1b0d1e5f62ac0a79fca01fb6377cdd33e90473c6f9f9a69"` | 8.11.1 |
| initContainerResources | object | `{}` |  |
| mysql.enabled | bool | `false` |  |
| mysql.gcp.cloudsql.registry | string | `"gcr.io"` |  |
| mysql.gcp.cloudsql.repository | string | `"cloud-sql-connectors/cloud-sql-proxy:2.14.2-alpine"` |  |
| mysql.gcp.cloudsql.resources.requests.cpu | string | `"1"` |  |
| mysql.gcp.cloudsql.resources.requests.memory | string | `"2Gi"` |  |
| mysql.gcp.cloudsql.securityContext.allowPrivilegeEscalation | bool | `false` |  |
| mysql.gcp.cloudsql.securityContext.capabilities.drop[0] | string | `"ALL"` |  |
| mysql.gcp.cloudsql.securityContext.readOnlyRootFilesystem | bool | `true` |  |
| mysql.gcp.cloudsql.securityContext.runAsNonRoot | bool | `true` |  |
| mysql.gcp.cloudsql.unixDomainSocket.enabled | bool | `false` |  |
| mysql.gcp.cloudsql.unixDomainSocket.path | string | `"/cloudsql"` |  |
| mysql.gcp.cloudsql.version | string | `"sha256:0a9a73d045cbec04fd64f6f06f8f5a865c4c75cef1913a54285dbaa75ea6d2ce"` | crane digest gcr.io/cloud-sql-connectors/cloud-sql-proxy:2.14.2-alpine |
| mysql.gcp.enabled | bool | `false` |  |
| mysql.gcp.instance | string | `""` |  |
| mysql.gcp.scaffoldSQLProxy.registry | string | `"ghcr.io"` |  |
| mysql.gcp.scaffoldSQLProxy.repository | string | `"sigstore/scaffolding/cloudsqlproxy"` |  |
| mysql.gcp.scaffoldSQLProxy.resources.requests.cpu | string | `"1"` |  |
| mysql.gcp.scaffoldSQLProxy.resources.requests.memory | string | `"2Gi"` |  |
| mysql.gcp.scaffoldSQLProxy.securityContext.allowPrivilegeEscalation | bool | `false` |  |
| mysql.gcp.scaffoldSQLProxy.securityContext.capabilities.drop[0] | string | `"ALL"` |  |
| mysql.gcp.scaffoldSQLProxy.securityContext.readOnlyRootFilesystem | bool | `true` |  |
| mysql.gcp.scaffoldSQLProxy.securityContext.runAsNonRoot | bool | `true` |  |
| mysql.gcp.scaffoldSQLProxy.version | string | `"sha256:77dfbe3f7c196c5e64d9efd6e69fcb025be834c42e82cb5e2120a2a4cea254a3"` | v0.7.18 which is based on cloud-sql-proxy:2.14.2-alpine |
| mysql.hostname | string | `""` |  |
| mysql.image.pullPolicy | string | `"IfNotPresent"` |  |
| mysql.image.registry | string | `"gcr.io"` |  |
| mysql.image.repository | string | `"trillian-opensource-ci/db_server"` |  |
| mysql.name | string | `"mysql"` |  |
| mysql.port | int | `3306` |  |
| mysql.replicaCount | int | `1` |  |
| mysql.strategy.type | string | `"Recreate"` |  |
| namespace.create | bool | `false` |  |
| namespace.name | string | `"rekor-system"` |  |
| redis.affinity | object | `{}` |  |
| redis.args[0] | string | `"--bind"` |  |
| redis.args[1] | string | `"0.0.0.0"` |  |
| redis.args[2] | string | `"--appendonly"` |  |
| redis.args[3] | string | `"yes"` |  |
| redis.enabled | bool | `true` |  |
| redis.hostname | string | `""` |  |
| redis.image.pullPolicy | string | `"IfNotPresent"` |  |
| redis.image.registry | string | `"docker.io"` |  |
| redis.image.repository | string | `"redis"` |  |
| redis.image.version | string | `"sha256:2ba50e1ac3a0ea17b736ce9db2b0a9f6f8b85d4c27d5f5accc6a416d8f42c6d5"` | 6.2.16-alpine3.20 |
| redis.name | string | `"redis"` |  |
| redis.nodeSelector | object | `{}` |  |
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
| redis.tolerations | list | `[]` |  |
| server.affinity | object | `{}` |  |
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
| server.awsKmsCredentialsSecretName | string | `"aws-kms-credentials"` | kubernetes secret name containing IAM credentials for use with AWS KMS |
| server.awsKmsRegion | string | `"us-east-1"` | AWS region if using AWS KMS for signing key |
| server.config.key | string | `"treeID"` |  |
| server.config.treeID | string | `""` |  |
| server.enabled | bool | `true` |  |
| server.extraArgs | list | `[]` |  |
| server.image.pullPolicy | string | `"IfNotPresent"` |  |
| server.image.registry | string | `"ghcr.io"` |  |
| server.image.repository | string | `"sigstore/rekor/rekor-server"` |  |
| server.image.version | string | `"sha256:9b10d2a1eb8180f9992f73269854328f0d5b27da5d9bfb70c65e1430355f3e96"` |  |
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
| server.kmsType | string | `"none"` | KMS type for signing key (possible values: "" / "none", "aws") |
| server.livenessProbe.failureThreshold | int | `3` |  |
| server.livenessProbe.httpGet.path | string | `"/ping"` |  |
| server.livenessProbe.httpGet.port | int | `3000` |  |
| server.livenessProbe.initialDelaySeconds | int | `30` |  |
| server.livenessProbe.periodSeconds | int | `10` |  |
| server.livenessProbe.successThreshold | int | `1` |  |
| server.livenessProbe.timeoutSeconds | int | `1` |  |
| server.logging.production | bool | `false` |  |
| server.name | string | `"server"` |  |
| server.nodeSelector | object | `{}` |  |
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
| server.searchIndex.mysql | object | `{}` |  |
| server.searchIndex.storageProvider | string | `""` |  |
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
| server.tolerations | list | `[]` |  |
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

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
