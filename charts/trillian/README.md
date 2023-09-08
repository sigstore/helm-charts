# trillian

<!-- This README.md is generated. Please edit README.md.gotmpl -->

![Version: 0.2.13](https://img.shields.io/badge/Version-0.2.13-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square)

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
| createdb.dbname | string | `"trillian"` |  |
| createdb.enabled | bool | `true` |  |
| createdb.image.pullPolicy | string | `"IfNotPresent"` |  |
| createdb.image.registry | string | `"ghcr.io"` |  |
| createdb.image.repository | string | `"sigstore/scaffolding/createdb"` |  |
| createdb.image.version | string | `"sha256:3720511269d5b01f386ac6650e26309a54abd5f13bb41597a0849501cf727e51"` | v0.6.7 |
| createdb.name | string | `"createdb"` |  |
| createdb.serviceAccount.annotations | object | `{}` |  |
| createdb.serviceAccount.create | bool | `false` |  |
| createdb.serviceAccount.name | string | `""` |  |
| createdb.ttlSecondsAfterFinished | int | `3600` |  |
| forceNamespace | string | `""` |  |
| initContainerImage.curl.imagePullPolicy | string | `"IfNotPresent"` |  |
| initContainerImage.curl.registry | string | `"docker.io"` |  |
| initContainerImage.curl.repository | string | `"curlimages/curl"` |  |
| initContainerImage.curl.version | string | `"sha256:9fab1b73f45e06df9506d947616062d7e8319009257d3a05d970b0de80a41ec5"` | 7.85.0 |
| initContainerImage.netcat.imagePullPolicy | string | `"IfNotPresent"` |  |
| initContainerImage.netcat.registry | string | `"cgr.dev"` |  |
| initContainerImage.netcat.repository | string | `"chainguard/netcat"` |  |
| initContainerImage.netcat.version | string | `"sha256:7243b469d34bd28969fa2c764a12d91084c427209540bb68645629d635b3f143"` | 2023-06-13 |
| logServer.enabled | bool | `true` |  |
| logServer.extraArgs | list | `[]` |  |
| logServer.image.pullPolicy | string | `"IfNotPresent"` |  |
| logServer.image.registry | string | `"gcr.io"` |  |
| logServer.image.repository | string | `"projectsigstore/trillian_log_server"` |  |
| logServer.image.version | string | `"sha256:ab60d5e16675fc15783ec8dbc99a335b68b9a0dd6dd4495ecc300c5f8aa58b72"` | v1.3.0 from rekor build |
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
| logSigner.enabled | bool | `true` |  |
| logSigner.extraArgs | list | `[]` |  |
| logSigner.forceMaster | bool | `true` |  |
| logSigner.image.pullPolicy | string | `"IfNotPresent"` |  |
| logSigner.image.registry | string | `"gcr.io"` |  |
| logSigner.image.repository | string | `"projectsigstore/trillian_log_signer"` |  |
| logSigner.image.version | string | `"sha256:54a75e22beb4cb90b7aef63a28ac9e33fee60b35a66a2b9e7d6444a40e2b6a79"` | v1.3.0 from rekor build |
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
| mysql.args[0] | string | `"--ignore-db-dir=lost+found"` |  |
| mysql.auth.existingSecret | string | `""` |  |
| mysql.auth.password | string | `""` |  |
| mysql.auth.rootPassword | string | `""` |  |
| mysql.auth.username | string | `"mysql"` |  |
| mysql.enabled | bool | `true` |  |
| mysql.gcp.cloudsql.registry | string | `"gcr.io"` |  |
| mysql.gcp.cloudsql.repository | string | `"cloud-sql-connectors/cloud-sql-proxy:2.6.1-alpine"` |  |
| mysql.gcp.cloudsql.resources.requests.cpu | string | `"1"` |  |
| mysql.gcp.cloudsql.resources.requests.memory | string | `"2Gi"` |  |
| mysql.gcp.cloudsql.securityContext.allowPrivilegeEscalation | bool | `false` |  |
| mysql.gcp.cloudsql.securityContext.capabilities.drop[0] | string | `"ALL"` |  |
| mysql.gcp.cloudsql.securityContext.readOnlyRootFilesystem | bool | `true` |  |
| mysql.gcp.cloudsql.securityContext.runAsNonRoot | bool | `true` |  |
| mysql.gcp.cloudsql.unixDomainSocket.enabled | bool | `false` |  |
| mysql.gcp.cloudsql.unixDomainSocket.path | string | `"/cloudsql"` |  |
| mysql.gcp.cloudsql.version | string | `"sha256:b0aee6522475a236254394e573bae95693c02f8a07bceccb110f4e90336a1722"` | crane digest cloud-sql-connectors/cloud-sql-proxy:2.6.1-alpine |
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
| mysql.gcp.scaffoldSQLProxy.version | string | `"sha256:e11cad1e3d64efced50f5af7dc068a524634eb01464fcfe6fc9440f281c9a01f"` | v0.6.7 which is based on cloud-sql-proxy:2.6.1-alpine |
| mysql.hostname | string | `""` |  |
| mysql.image.pullPolicy | string | `"IfNotPresent"` |  |
| mysql.image.registry | string | `"gcr.io"` |  |
| mysql.image.repository | string | `"trillian-opensource-ci/db_server"` |  |
| mysql.image.version | string | `"sha256:c04753ed44eac715e3191dad16fb0848a06714ddcb00c6f7768bf065485e1f8d"` | crane digest gcr.io/trillian-opensource-ci/db_server:v1.5.2 |
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
