# rekor-createtree

![Version: 0.0.1](https://img.shields.io/badge/Version-0.0.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square)

Part of the sigstore project, rekor-createtree is used to create new Trillian trees for Rekor.

**Homepage:** <https://sigstore.dev/>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| The Sigstore Authors |  |  |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| createtree.configMap | string | `"rekor-config"` |  |
| createtree.force | bool | `true` |  |
| createtree.image.pullPolicy | string | `"IfNotPresent"` |  |
| createtree.image.registry | string | `"ghcr.io"` |  |
| createtree.image.repository | string | `"sigstore/scaffolding/createtree"` |  |
| createtree.image.version | string | `"sha256:03e7b3b068e61f65a730b7a95f498c76a02ddecb4f7a65e09b2753b66ac8399f"` |  |
| createtree.name | string | `"createtree"` |  |
| createtree.securityContext.runAsNonRoot | bool | `true` |  |
| createtree.securityContext.runAsUser | int | `65533` |  |
| createtree.serviceAccount.create | bool | `false` |  |
| createtree.serviceAccount.name | string | `"rekor-createtree"` |  |
| namespace | string | `"rekor-system"` |  |
| trillian.adminServer | string | `"trillian-logserver.trillian-system:8091"` |  |
| trillian.enabled | bool | `true` |  |
| trillian.forceNamespace | string | `"trillian-system"` |  |
| trillian.fullnameOverride | string | `"trillian"` |  |
| trillian.logServer.fullnameOverride | string | `"trillian-logserver"` |  |
| trillian.logServer.name | string | `"trillian-logserver"` |  |
| trillian.logServer.portHTTP | int | `8090` |  |
| trillian.logServer.portRPC | int | `8091` |  |
| trillian.namespace.create | bool | `true` |  |
| trillian.namespace.name | string | `"trillian-system"` |  |

