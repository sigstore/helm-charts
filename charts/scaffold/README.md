# scaffold

<!-- This README.md is generated. Please edit README.md.gotmpl -->

![Version: 0.6.94](https://img.shields.io/badge/Version-0.6.94-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square)

Scaffolding the components of the sigstore architecture

**Homepage:** <https://sigstore.dev/>

## Quick Installation

To install the helm chart with default values run following command.
The [Values](#Values) section describes the configuration options for this chart.

```shell
helm dependency update .
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
| The Sigstore Authors |  |  |

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://sigstore.github.io/helm-charts | ctlog | 0.2.64 |
| https://sigstore.github.io/helm-charts | fulcio | 2.6.12 |
| https://sigstore.github.io/helm-charts | rekor | 1.7.3 |
| https://sigstore.github.io/helm-charts | trillian | 0.3.12 |
| https://sigstore.github.io/helm-charts | tsa | 1.1.8 |
| https://sigstore.github.io/helm-charts | tuf | 0.1.27 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| copySecretJob.affinity | object | `{}` |  |
| copySecretJob.backoffLimit | int | `6` |  |
| copySecretJob.copySecretCronJob.backoffLimit | int | `2` |  |
| copySecretJob.copySecretCronJob.enabled | bool | `false` |  |
| copySecretJob.copySecretCronJob.failedJobsHistoryLimit | int | `1` |  |
| copySecretJob.copySecretCronJob.schedule | string | `"*/5 * * * 1-5"` |  |
| copySecretJob.copySecretCronJob.successfulJobsHistoryLimit | int | `1` |  |
| copySecretJob.enabled | bool | `false` |  |
| copySecretJob.imagePullPolicy | string | `"IfNotPresent"` |  |
| copySecretJob.name | string | `"copy-secrets-job"` |  |
| copySecretJob.nodeSelector | object | `{}` |  |
| copySecretJob.registry | string | `"docker.io"` |  |
| copySecretJob.repository | string | `"alpine/k8s"` |  |
| copySecretJob.serviceaccount | string | `"tuf-secret-copy-job"` |  |
| copySecretJob.tolerations | list | `[]` |  |
| copySecretJob.version | string | `"sha256:fb0d2db81fb0f98abb1adf5246d6f0f4d19f34031afe4759cb7ad8e2eb8d2c01"` |  |
| ctlog.affinity | object | `{}` |  |
| ctlog.createcerts.fullnameOverride | string | `"ctlog-createcerts"` |  |
| ctlog.createtree.displayName | string | `"ctlog-tree"` |  |
| ctlog.createtree.fullnameOverride | string | `"ctlog-createtree"` |  |
| ctlog.enabled | bool | `true` |  |
| ctlog.forceNamespace | string | `"ctlog-system"` |  |
| ctlog.fullnameOverride | string | `"ctlog"` |  |
| ctlog.namespace.create | bool | `true` |  |
| ctlog.namespace.name | string | `"ctlog-system"` |  |
| ctlog.nodeSelector | object | `{}` |  |
| ctlog.tolerations | list | `[]` |  |
| fulcio.affinity | object | `{}` |  |
| fulcio.createcerts.fullnameOverride | string | `"fulcio-createcerts"` |  |
| fulcio.ctlog.createctconfig.logPrefix | string | `"sigstorescaffolding"` |  |
| fulcio.ctlog.enabled | bool | `false` |  |
| fulcio.enabled | bool | `true` |  |
| fulcio.forceNamespace | string | `"fulcio-system"` |  |
| fulcio.namespace.create | bool | `true` |  |
| fulcio.namespace.name | string | `"fulcio-system"` |  |
| fulcio.nodeSelector | object | `{}` |  |
| fulcio.server.fullnameOverride | string | `"fulcio-server"` |  |
| fulcio.tolerations | list | `[]` |  |
| rekor.affinity | object | `{}` |  |
| rekor.enabled | bool | `true` |  |
| rekor.forceNamespace | string | `"rekor-system"` |  |
| rekor.fullnameOverride | string | `"rekor"` |  |
| rekor.namespace.create | bool | `true` |  |
| rekor.namespace.name | string | `"rekor-system"` |  |
| rekor.nodeSelector | object | `{}` |  |
| rekor.redis.fullnameOverride | string | `"rekor-redis"` |  |
| rekor.server.fullnameOverride | string | `"rekor-server"` |  |
| rekor.tolerations | list | `[]` |  |
| rekor.trillian.enabled | bool | `false` |  |
| secrets.ctlog.create | bool | `false` |  |
| secrets.ctlog.deploymentName | string | `"ctlog"` |  |
| secrets.ctlog.key | string | `"public"` |  |
| secrets.ctlog.name | string | `"ctlog-public-key"` |  |
| secrets.ctlog.namespace | string | `"ctlog-system"` |  |
| secrets.ctlog.path | string | `"ctfe.pub"` |  |
| secrets.fulcio.create | bool | `false` |  |
| secrets.fulcio.deploymentName | string | `"fulcio-server"` |  |
| secrets.fulcio.key | string | `"cert"` |  |
| secrets.fulcio.name | string | `"fulcio-server-secret"` |  |
| secrets.fulcio.namespace | string | `"fulcio-system"` |  |
| secrets.fulcio.path | string | `"fulcio_v1.crt.pem"` |  |
| secrets.rekor.create | bool | `false` |  |
| secrets.rekor.deploymentName | string | `"rekor-server"` |  |
| secrets.rekor.key | string | `"key"` |  |
| secrets.rekor.name | string | `"rekor-public-key"` |  |
| secrets.rekor.namespace | string | `"rekor-system"` |  |
| secrets.rekor.path | string | `"rekor.pub"` |  |
| secrets.tsa.create | bool | `false` |  |
| secrets.tsa.deploymentName | string | `"tsa-server"` |  |
| secrets.tsa.key | string | `"cert-chain"` |  |
| secrets.tsa.name | string | `"tsa-cert-chain"` |  |
| secrets.tsa.namespace | string | `"tsa-system"` |  |
| secrets.tsa.path | string | `"tsa.certchain.pem"` |  |
| trillian.affinity | object | `{}` |  |
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
| trillian.nodeSelector | object | `{}` |  |
| trillian.tolerations | list | `[]` |  |
| tsa.affinity | object | `{}` |  |
| tsa.enabled | bool | `false` |  |
| tsa.forceNamespace | string | `"tsa-system"` |  |
| tsa.namespace.create | bool | `true` |  |
| tsa.namespace.name | string | `"tsa-system"` |  |
| tsa.nodeSelector | object | `{}` |  |
| tsa.server.fullnameOverride | string | `"tsa-server"` |  |
| tsa.tolerations | list | `[]` |  |
| tuf.affinity | object | `{}` |  |
| tuf.enabled | bool | `false` |  |
| tuf.forceNamespace | string | `"tuf-system"` |  |
| tuf.fullnameOverride | string | `"tuf"` |  |
| tuf.namespace.create | bool | `true` |  |
| tuf.namespace.name | string | `"tuf-system"` |  |
| tuf.nodeSelector | object | `{}` |  |
| tuf.tolerations | list | `[]` |  |

----------------------------------------------

## Ingress

To enabled access from external resources, an Ingress resource is created for both Rekor and Fulcio. The configuration necessary for each Ingress resource is primarily dependent on the specific Ingress Controller being used. In most cases, implementation specific configuration is specified as annotations on the Ingress resources. These can be applied using the `fulcio.server.ingress.annotations` and `rekor.server.ingress.annotations` parameters.
