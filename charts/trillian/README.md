# trillian

<!-- This README.md is generated. Please edit README.md.gotmpl -->

![Version: 0.2.29](https://img.shields.io/badge/Version-0.2.29-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.6.1](https://img.shields.io/badge/AppVersion-1.6.1-informational?style=flat-square)

Trillian is a log that stores an accurate, immutable and verifiable history of activity.

**Homepage:** <https://sigstore.dev/>

## Quick Installation

To install the helm chart with default values run following command.
The [Values](#Values) section describes the configuration options for this chart.

```shell
helm install [RELEASE_NAME] .
```

## Uninstallation

To uninstall the Helm chart run following command.

```shell
helm uninstall [RELEASE_NAME]
```

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| The Sigstore Authors |  | <https://sigstore.dev/> |

## Source Code

* <https://github.com/google/trillian>
* <https://github.com/sigstore/helm-charts/tree/main/charts/trillian>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| createdb.affinity | object | `{}` |  |
| createdb.dbname | string | `"trillian"` |  |
| createdb.enabled | bool | `true` |  |
| createdb.image.pullPolicy | string | `"IfNotPresent"` |  |
| createdb.image.registry | string | `"ghcr.io"` |  |
| createdb.image.repository | string | `"sigstore/scaffolding/createdb"` |  |
| createdb.image.version | string | `"sha256:b8f6e7c370228ce4412016d783a5b8f890cb1fb8e7e7acfd8d2c723537270954"` | v0.7.15 |
| createdb.name | string | `"createdb"` |  |
| createdb.nodeSelector | object | `{}` |  |
| createdb.serviceAccount.annotations | object | `{}` |  |
| createdb.serviceAccount.create | bool | `false` |  |
| createdb.serviceAccount.name | string | `""` |  |
| createdb.tolerations | list | `[]` |  |
| createdb.ttlSecondsAfterFinished | int | `3600` |  |
| forceNamespace | string | `""` |  |
| imagePullSecrets | list | `[]` |  |
| initContainerImage.curl.imagePullPolicy | string | `"IfNotPresent"` |  |
| initContainerImage.curl.registry | string | `"docker.io"` |  |
| initContainerImage.curl.repository | string | `"curlimages/curl"` |  |
| initContainerImage.curl.version | string | `"sha256:d9b4541e214bcd85196d6e92e2753ac6d0ea699f0af5741f8c6cccbfcf00ef4b"` | 8.10.1 |
| initContainerImage.netcat.imagePullPolicy | string | `"IfNotPresent"` |  |
| initContainerImage.netcat.registry | string | `"cgr.dev"` |  |
| initContainerImage.netcat.repository | string | `"chainguard/netcat"` |  |
| initContainerImage.netcat.version | string | `"sha256:6051975a14c51b9d3b525a06004d62a4d323c08ca58e3468343095a55a42fff2"` | 2024-09-03 |
| logServer.affinity | object | `{}` |  |
| logServer.enabled | bool | `true` |  |
| logServer.extraArgs | list | `[]` |  |
| logServer.image.pullPolicy | string | `"IfNotPresent"` |  |
| logServer.image.registry | string | `"ghcr.io"` |  |
| logServer.image.repository | string | `"sigstore/scaffolding/trillian_log_server"` |  |
| logServer.image.version | string | `"sha256:721b0e89ca3c5e6a167299836880953e2354071eae624a1123fdb5b444d16f76"` | trillian v1.6.1 (scaffolding v0.7.15) |
| logServer.livenessProbe | object | `{}` |  |
| logServer.name | string | `"log-server"` |  |
| logServer.nodeSelector | object | `{}` |  |
| logServer.portHTTP | int | `8090` |  |
| logServer.portRPC | int | `8091` |  |
| logServer.readinessProbe | object | `{}` |  |
| logServer.replicaCount | int | `1` |  |
| logServer.resources | object | `{}` |  |
| logServer.service.ports[0].name | string | `"8091-tcp"` |  |
| logServer.service.ports[0].port | int | `8091` |  |
| logServer.service.ports[0].protocol | string | `"TCP"` |  |
| logServer.service.ports[0].targetPort | int | `8091` |  |
| logServer.service.ports[1].name | string | `"8090-tcp"` |  |
| logServer.service.ports[1].port | int | `8090` |  |
| logServer.service.ports[1].protocol | string | `"TCP"` |  |
| logServer.service.ports[1].targetPort | int | `8090` |  |
| logServer.service.type | string | `"ClusterIP"` |  |
| logServer.serviceAccount.annotations | object | `{}` |  |
| logServer.serviceAccount.create | bool | `true` |  |
| logServer.serviceAccount.name | string | `""` |  |
| logServer.tolerations | list | `[]` |  |
| logSigner.affinity | object | `{}` |  |
| logSigner.enabled | bool | `true` |  |
| logSigner.extraArgs | list | `[]` |  |
| logSigner.forceMaster | bool | `true` |  |
| logSigner.image.pullPolicy | string | `"IfNotPresent"` |  |
| logSigner.image.registry | string | `"ghcr.io"` |  |
| logSigner.image.repository | string | `"sigstore/scaffolding/trillian_log_signer"` |  |
| logSigner.image.version | string | `"sha256:6d3592457acf9823c6f1dbe03e0cac29dddcfe4eb502bb05a8acf8fdb02a6de5"` | trillian v1.6.1 (scaffolding v0.7.15) |
| logSigner.livenessProbe | object | `{}` |  |
| logSigner.name | string | `"log-signer"` |  |
| logSigner.nodeSelector | object | `{}` |  |
| logSigner.portHTTP | int | `8090` |  |
| logSigner.portRPC | int | `8091` |  |
| logSigner.readinessProbe | object | `{}` |  |
| logSigner.replicaCount | int | `1` |  |
| logSigner.resources | object | `{}` |  |
| logSigner.service.ports[0].name | string | `"8091-tcp"` |  |
| logSigner.service.ports[0].port | int | `8091` |  |
| logSigner.service.ports[0].protocol | string | `"TCP"` |  |
| logSigner.service.ports[0].targetPort | int | `8091` |  |
| logSigner.service.type | string | `"ClusterIP"` |  |
| logSigner.serviceAccount.annotations | object | `{}` |  |
| logSigner.serviceAccount.create | bool | `true` |  |
| logSigner.serviceAccount.name | string | `""` |  |
| logSigner.tolerations | list | `[]` |  |
| mysql.args[0] | string | `"--ignore-db-dir=lost+found"` |  |
| mysql.auth.existingSecret | string | `""` |  |
| mysql.auth.password | string | `""` |  |
| mysql.auth.rootPassword | string | `""` |  |
| mysql.auth.username | string | `"mysql"` |  |
| mysql.enabled | bool | `true` |  |
| mysql.gcp.cloudsql.registry | string | `"gcr.io"` |  |
| mysql.gcp.cloudsql.repository | string | `"cloud-sql-connectors/cloud-sql-proxy:2.14.0-alpine"` |  |
| mysql.gcp.cloudsql.resources.requests.cpu | string | `"1"` |  |
| mysql.gcp.cloudsql.resources.requests.memory | string | `"2Gi"` |  |
| mysql.gcp.cloudsql.securityContext.allowPrivilegeEscalation | bool | `false` |  |
| mysql.gcp.cloudsql.securityContext.capabilities.drop[0] | string | `"ALL"` |  |
| mysql.gcp.cloudsql.securityContext.readOnlyRootFilesystem | bool | `true` |  |
| mysql.gcp.cloudsql.securityContext.runAsNonRoot | bool | `true` |  |
| mysql.gcp.cloudsql.unixDomainSocket.enabled | bool | `false` |  |
| mysql.gcp.cloudsql.unixDomainSocket.path | string | `"/cloudsql"` |  |
| mysql.gcp.cloudsql.version | string | `"sha256:6dc1d9ea84ff43eaeaebe51bb52de9e24dce8d8affd2fda0dc0d218897456c12"` | crane digest gcr.io/cloud-sql-connectors/cloud-sql-proxy:2.14.0-alpine |
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
| mysql.gcp.scaffoldSQLProxy.version | string | `"sha256:862598dc2457fd246dc5363e0bd21462343c89e714dbd4159e49f119e8ff5ca5"` | v0.7.15 which is based on cloud-sql-proxy:2.14.0-alpine |
| mysql.hostname | string | `""` |  |
| mysql.image.pullPolicy | string | `"IfNotPresent"` |  |
| mysql.image.registry | string | `"gcr.io"` |  |
| mysql.image.repository | string | `"trillian-opensource-ci/db_server"` |  |
| mysql.image.version | string | `"sha256:2a685a38dd0129cceb646c232d285383f614c7e6fa51ff8f512aef78e4298461"` | crane digest gcr.io/trillian-opensource-ci/db_server:v1.5.3 |
| mysql.livenessProbe.exec.command[0] | string | `"/etc/init.d/mysql"` |  |
| mysql.livenessProbe.exec.command[1] | string | `"status"` |  |
| mysql.livenessProbe.failureThreshold | int | `3` |  |
| mysql.livenessProbe.initialDelaySeconds | int | `30` |  |
| mysql.livenessProbe.periodSeconds | int | `10` |  |
| mysql.livenessProbe.successThreshold | int | `1` |  |
| mysql.livenessProbe.timeoutSeconds | int | `1` |  |
| mysql.name | string | `"mysql"` |  |
| mysql.persistence.accessModes[0] | string | `"ReadWriteOnce"` |  |
| mysql.persistence.annotations | object | `{}` |  |
| mysql.persistence.enabled | bool | `true` |  |
| mysql.persistence.existingClaim | string | `""` |  |
| mysql.persistence.mountPath | string | `"/var/lib/mysql"` |  |
| mysql.persistence.size | string | `"5Gi"` |  |
| mysql.persistence.storageClass | string | `nil` |  |
| mysql.persistence.subPath | string | `""` |  |
| mysql.port | int | `3306` |  |
| mysql.readinessProbe.exec.command[0] | string | `"/etc/init.d/mysql"` |  |
| mysql.readinessProbe.exec.command[1] | string | `"status"` |  |
| mysql.readinessProbe.failureThreshold | int | `3` |  |
| mysql.readinessProbe.initialDelaySeconds | int | `10` |  |
| mysql.readinessProbe.periodSeconds | int | `10` |  |
| mysql.readinessProbe.successThreshold | int | `1` |  |
| mysql.readinessProbe.timeoutSeconds | int | `1` |  |
| mysql.replicaCount | int | `1` |  |
| mysql.resources | object | `{}` |  |
| mysql.secret.annotations | object | `{}` |  |
| mysql.service.ports[0].name | string | `"3306-tcp"` |  |
| mysql.service.ports[0].port | int | `3306` |  |
| mysql.service.ports[0].protocol | string | `"TCP"` |  |
| mysql.service.ports[0].targetPort | int | `3306` |  |
| mysql.service.type | string | `"ClusterIP"` |  |
| mysql.serviceAccount.annotations | object | `{}` |  |
| mysql.serviceAccount.create | bool | `true` |  |
| mysql.serviceAccount.name | string | `""` |  |
| mysql.strategy.type | string | `"Recreate"` |  |
| namespace.create | bool | `false` |  |
| namespace.name | string | `"trillian-system"` |  |
| quotaSystem.driver | string | `"mysql"` |  |
| storageSystem.driver | string | `"mysql"` |  |
| storageSystem.envCredentials | string | `nil` |  |
