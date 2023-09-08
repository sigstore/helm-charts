# scaffold

<!-- This README.md is generated. Please edit README.md.gotmpl -->

![Version: 0.6.28](https://img.shields.io/badge/Version-0.6.28-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square)

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
| https://sigstore.github.io/helm-charts | ctlog | 0.2.45 |
| https://sigstore.github.io/helm-charts | fulcio | 2.3.9 |
| https://sigstore.github.io/helm-charts | rekor | 1.3.8 |
| https://sigstore.github.io/helm-charts | trillian | 0.2.13 |
| https://sigstore.github.io/helm-charts | tsa | 0.1.0 |
| https://sigstore.github.io/helm-charts | tuf | 0.1.6 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| copySecretJob.backoffLimit | int | `6` |  |
| copySecretJob.enabled | bool | `false` |  |
| copySecretJob.imagePullPolicy | string | `"IfNotPresent"` |  |
| copySecretJob.name | string | `"copy-secrets-job"` |  |
| copySecretJob.registry | string | `"docker.io"` |  |
| copySecretJob.repository | string | `"alpine/k8s"` |  |
| copySecretJob.serviceaccount | string | `"tuf-secret-copy-job"` |  |
| copySecretJob.version | string | `"sha256:fb0d2db81fb0f98abb1adf5246d6f0f4d19f34031afe4759cb7ad8e2eb8d2c01"` |  |
| ctlog.createcerts.fullnameOverride | string | `"ctlog-createcerts"` |  |
| ctlog.createtree.displayName | string | `"ctlog-tree"` |  |
| ctlog.createtree.fullnameOverride | string | `"ctlog-createtree"` |  |
| ctlog.enabled | bool | `true` |  |
| ctlog.forceNamespace | string | `"ctlog-system"` |  |
| ctlog.fullnameOverride | string | `"ctlog"` |  |
| ctlog.namespace.create | bool | `true` |  |
| ctlog.namespace.name | string | `"ctlog-system"` |  |
| fulcio.createcerts.fullnameOverride | string | `"fulcio-createcerts"` |  |
| fulcio.ctlog.createctconfig.logPrefix | string | `"sigstorescaffolding"` |  |
| fulcio.ctlog.enabled | bool | `false` |  |
| fulcio.enabled | bool | `true` |  |
| fulcio.forceNamespace | string | `"fulcio-system"` |  |
| fulcio.namespace.create | bool | `true` |  |
| fulcio.namespace.name | string | `"fulcio-system"` |  |
| fulcio.server.fullnameOverride | string | `"fulcio-server"` |  |
| rekor.enabled | bool | `true` |  |
| rekor.forceNamespace | string | `"rekor-system"` |  |
| rekor.fullnameOverride | string | `"rekor"` |  |
| rekor.namespace.create | bool | `true` |  |
| rekor.namespace.name | string | `"rekor-system"` |  |
| rekor.redis.fullnameOverride | string | `"rekor-redis"` |  |
| rekor.server.fullnameOverride | string | `"rekor-server"` |  |
| rekor.trillian.enabled | bool | `false` |  |
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
| tsa.enabled | bool | `false` |  |
| tsa.forceNamespace | string | `"tsa-system"` |  |
| tsa.namespace.create | bool | `true` |  |
| tsa.namespace.name | string | `"tsa-system"` |  |
| tsa.server.fullnameOverride | string | `"tsa-server"` |  |
| tuf.enabled | bool | `false` |  |
| tuf.forceNamespace | string | `"tuf-system"` |  |
| tuf.fullnameOverride | string | `"tuf"` |  |
| tuf.namespace.create | bool | `true` |  |
| tuf.namespace.name | string | `"tuf-system"` |  |
| tuf.secrets.ctlog.name | string | `"ctlog-public-key"` |  |
| tuf.secrets.ctlog.path | string | `"ctlog-pubkey"` |  |
| tuf.secrets.fulcio.name | string | `"fulcio-server-secret"` |  |
| tuf.secrets.fulcio.path | string | `"fulcio-cert"` |  |
| tuf.secrets.rekor.name | string | `"rekor-public-key"` |  |
| tuf.secrets.rekor.path | string | `"rekor-pubkey"` |  |

----------------------------------------------

## Ingress

To enabled access from external resources, an Ingress resource is created for both Rekor and Fulcio. The configuration necessary for each Ingress resource is primarily dependent on the specific Ingress Controller being used. In most cases, implementation specific configuration is specified as annotations on the Ingress resources. These can be applied using the `fulcio.server.ingress.annotations` and `rekor.server.ingress.annotations` parameters.
