# scaffold

Umbrella chart for deploying the components of the [sigstore](https://www.sigstore.dev/) architecture.

The following components are also included as either direct components or through chart dependencies:

* ctlog
* [Fulcio](https://docs.sigstore.dev/fulcio/overview/)
* [MySQL](https://www.mysql.com)
* [Redis](https://redis.io)
* [Rekor](https://docs.sigstore.dev/rekor/overview/)
* [Trillian Log Server](https://github.com/google/trillian)
* [Trillian Log Signer](https://github.com/google/trillian)

## Quick Installation

```shell
helm dependency update .
helm install [RELEASE_NAME] .
```

This command deploys the default configuration for the scaffold chart. The [Parameters] section describes the various ways in which the chart can be configured.

## Uninstallation

```shell
helm uninstall [RELEASE_NAME]
```

The previous command removes the previously installed chart.

## Parameters

The following table lists the configurable parameters of the scaffold chart and their default values.

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| ctlog.createcerts.fullnameOverride | string | `"ctlog-createcerts"` |  |
| ctlog.createtree.fullnameOverride | string | `"ctlog-createtree"` |  |
| ctlog.enabled | bool | `true` |  |
| ctlog.forceNamespace | string | `"ctlog-system"` |  |
| ctlog.fullnameOverride | string | `"ctlog"` |  |
| ctlog.namespace.create | bool | `true` |  |
| ctlog.namespace.name | string | `"ctlog-system"` |  |
| fulcio.createcerts.fullnameOverride | string | `"fulcio-createcerts"` |  |
| fulcio.ctlog.enabled | bool | `false` |  |
| fulcio.enabled | bool | `true` |  |
| fulcio.forceNamespace | string | `"fulcio-system"` |  |
| fulcio.fullnameOverride | string | `"fulcio"` |  |
| fulcio.namespace.create | bool | `true` |  |
| fulcio.namespace.name | string | `"fulcio-system"` |  |
| rekor.createtree.fullnameOverride | string | `"rekor-checktree"` |  |
| rekor.enabled | bool | `true` |  |
| rekor.forceNamespace | string | `"rekor-system"` |  |
| rekor.fullnameOverride | string | `"rekor"` |  |
| rekor.namespace.create | bool | `true` |  |
| rekor.namespace.name | string | `"rekor-system"` |  |
| rekor.redis.fullnameOverride | string | `"rekor-redis"` |  |
| rekor.server.fullnameOverride | string | `"rekor-server"` |  |
| rekor.trillian.enabled | bool | `false` |  |
| trillian.createdb.fullnameOverride | string | `"trillian-createdb"` |  |
| trillian.createtree.fullnameOverride | string | `"trillian-checktree"` |  |
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

## Ingress

To enabled access from external resources, an Ingress resource is created for both Rekor and Fulcio. The configuration necessary for each Ingress resource is primarily dependent on the specific Ingress Controller being used. In most cases, implementation specific configuration is specified as annotations on the Ingress resources. These can be applied using the `fulcio.server.ingress.annotations` and `rekor.server.ingress.annotations` parameters.
