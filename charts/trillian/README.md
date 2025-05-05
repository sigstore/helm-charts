# trillian

<!-- This README.md is generated. Please edit README.md.gotmpl -->

![Version: 0.3.5](https://img.shields.io/badge/Version-0.3.5-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.7.2](https://img.shields.io/badge/AppVersion-1.7.2-informational?style=flat-square)

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
| createdb.image.version | string | `"sha256:2f8618f678448c0e7550baf79bf16fdfd4b9d8dce7ca526d8393c39189663401"` | v0.7.23 |
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
| initContainerImage.curl.version | string | `"sha256:d43bdb28bae0be0998f3be83199bfb2b81e0a30b034b6d7586ce7e05de34c3fd"` | 8.13.0 |
| initContainerImage.netcat.imagePullPolicy | string | `"IfNotPresent"` |  |
| initContainerImage.netcat.registry | string | `"docker.io"` |  |
| initContainerImage.netcat.repository | string | `"subfuzion/netcat"` |  |
| initContainerImage.netcat.version | string | `"sha256:7e808e84a631d9c2cd5a04f6a084f925ea388e3127553461536c1248c3333c8a"` | 2024-09-03 |
| logServer.affinity | object | `{}` |  |
| logServer.enabled | bool | `true` |  |
| logServer.extraArgs | list | `[]` |  |
| logServer.image.pullPolicy | string | `"IfNotPresent"` |  |
| logServer.image.registry | string | `"ghcr.io"` |  |
| logServer.image.repository | string | `"sigstore/scaffolding/trillian_log_server"` |  |
| logServer.image.version | string | `"sha256:ff64f73b4a8acae7546ecfb5b73c90933b614130a3b43c764a35535e4f60451b"` | trillian v1.7.2 (scaffolding v0.7.23) |
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
| logSigner.image.version | string | `"sha256:bfcc659dc08f87a0f4a4797edf88c93426a95f0d004032779a028bdce7b7e821"` | trillian v1.7.2 (scaffolding v0.7.23) |
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
| mysql.gcp.cloudsql.repository | string | `"cloud-sql-connectors/cloud-sql-proxy:2.16.0-alpine"` |  |
| mysql.gcp.cloudsql.resources.requests.cpu | string | `"1"` |  |
| mysql.gcp.cloudsql.resources.requests.memory | string | `"2Gi"` |  |
| mysql.gcp.cloudsql.securityContext.allowPrivilegeEscalation | bool | `false` |  |
| mysql.gcp.cloudsql.securityContext.capabilities.drop[0] | string | `"ALL"` |  |
| mysql.gcp.cloudsql.securityContext.readOnlyRootFilesystem | bool | `true` |  |
| mysql.gcp.cloudsql.securityContext.runAsNonRoot | bool | `true` |  |
| mysql.gcp.cloudsql.unixDomainSocket.enabled | bool | `false` |  |
| mysql.gcp.cloudsql.unixDomainSocket.path | string | `"/cloudsql"` |  |
| mysql.gcp.cloudsql.version | string | `"sha256:a8d5ff52389cd02e857935b7b61075f3065b44b11c55956877d3950549c8ffef"` | crane digest gcr.io/cloud-sql-connectors/cloud-sql-proxy:2.16.0-alpine |
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
| mysql.gcp.scaffoldSQLProxy.version | string | `"sha256:7af4f38f2d5a1989c90df9dbae6a1a64d2d6b0b3871608aad2492b7cba67fa1e"` | v0.7.23 which is based on cloud-sql-proxy:2.16.0-alpine |
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
| storageSystem.envCredentials | list | `[]` |  |
