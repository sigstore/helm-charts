# rekor

![Version: 1.0.0-rc.2](https://img.shields.io/badge/Version-1.0.0--rc.2-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.0.0-rc.2](https://img.shields.io/badge/AppVersion-1.0.0--rc.2-informational?style=flat-square)

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
| https://sigstore.github.io/helm-charts | trillian | 0.1.10 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| createtree.annotations | object | `{}` |  |
| createtree.force | bool | `false` |  |
| createtree.image.pullPolicy | string | `"IfNotPresent"` |  |
| createtree.image.registry | string | `"ghcr.io"` |  |
| createtree.image.repository | string | `"sigstore/scaffolding/createtree"` |  |
| createtree.image.version | string | `"sha256:03e7b3b068e61f65a730b7a95f498c76a02ddecb4f7a65e09b2753b66ac8399f"` |  |
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
| server.image.version | string | `"sha256:441da6a9c40ace07f72ed88790f2248a64c266a7e56ccfd7914080ee61432342"` | `"v1.0.0"` |
| server.ingress.annotations | object | `{}` |  |
| server.ingress.className | string | `"nginx"` |  |
| server.ingress.enabled | bool | `true` |  |
| server.ingress.hosts[0].path | string | `"/"` |  |
| server.ingress.tls | list | `[]` |  |
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

----------------------------------------------

## MySQL Credentials

Credentials for running (when deployed) and connecting to MySQL are stored in a secret resource. The _passsword_ and _root password_ are automatically generated when not provided.

_Note:_ If you plan to perform an upgrade of the chart, be sure to specify these values explicitly.

An existing secret containing credentials for MySQL can be provided by passing the `mysql.auth.existingSecret` parameter. This secret must have the following keys:

* `mysql-password` - Password for connecting to MySQL
* `mysql-root-password` - Root Password (required when deploying MySQL)

## Integration with External Components

By Default, the chart deploys all required services. However, configurations can be applied to offload certain services, such as Redis and MySQL externally.

To disable the deployment of Redis or MySQL, pass the `redis.enabled=false` and/or `mysql.enabled=false`. Provide the hostname and port of the external resource using the `<redis|mysql>.hostname` and `<redis|mysql>.port` parameters.

## Ingress

To enabled access from external resources, an Ingress resource is created. The configuration necessary for each Ingress resource is primarily dependent on the specific Ingress Controller being used. In most cases, implementation specific configuration is specified as annotations on the Ingress resources. These can be applied using the `server.ingress.annotations` parameter.
