# fulcio

<!-- This README.md is generated. Please edit README.md.gotmpl -->

![Version: 2.0.0](https://img.shields.io/badge/Version-2.0.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.0.0](https://img.shields.io/badge/AppVersion-1.0.0-informational?style=flat-square)

Fulcio is a free code signing Certificate Authority, built to make short-lived certificates available to anyone.

**Homepage:** <https://sigstore.dev/>

The following components are also included as either direct components or through chart dependencies:

* [ctlog](https://github.com/sigstore/helm-charts/tree/main/charts/ctlog)

> **Note**: `0.3.0` NOT backwards compatible
>
> In version `0.3.0`, we will be introducing a second ingress in support of the new gRPC endpoint as introduced in `v0.4.0` of Fulcio.
>
> The change in particular is the structure of the ingress values.
>
> **Previously**
>
> ```shell
> server:
>   ingress:
>     enabled: true
>     hosts:
>       - host: fulcio.localhost
>         path: /
> ```
>
> **Now**
>
> ```shell
> server:
>   ingress:
>     http:
>       enabled: true
>       hosts:
>         - host: fulcio.localhost
>           path: /
>     grpc:
>       enabled: false
> ```

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
| https://sigstore.github.io/helm-charts | ctlog | 0.2.27 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| config.contents | object | `{}` |  |
| createcerts.annotations | object | `{}` |  |
| createcerts.enabled | bool | `true` |  |
| createcerts.image.pullPolicy | string | `"IfNotPresent"` |  |
| createcerts.image.registry | string | `"ghcr.io"` |  |
| createcerts.image.repository | string | `"sigstore/scaffolding/createcerts"` |  |
| createcerts.image.version | string | `"sha256:73e7ac35d0e5169bd14a5cb6caed2e7d44277dec3d1de92e08f4d055523089a1"` |  |
| createcerts.name | string | `"createcerts"` |  |
| createcerts.replicaCount | int | `1` |  |
| createcerts.resources | string | `""` |  |
| createcerts.securityContext.runAsNonRoot | bool | `true` |  |
| createcerts.securityContext.runAsUser | int | `65533` |  |
| createcerts.serviceAccount.annotations | object | `{}` |  |
| createcerts.serviceAccount.create | bool | `true` |  |
| createcerts.serviceAccount.mountToken | bool | `true` |  |
| createcerts.serviceAccount.name | string | `""` |  |
| createcerts.ttlSecondsAfterFinished | int | `3600` |  |
| ctlog.createcerts.fullnameOverride | string | `"ctlog-createcerts"` |  |
| ctlog.createcerts.name | string | `"ctlog-createcerts"` |  |
| ctlog.createctconfig.logPrefix | string | `"fulcio"` |  |
| ctlog.createtree.fullnameOverride | string | `"ctlog-createtree"` |  |
| ctlog.createtree.name | string | `"ctlog-createtree"` |  |
| ctlog.enabled | bool | `true` |  |
| ctlog.forceNamespace | string | `"ctlog-system"` |  |
| ctlog.fullnameOverride | string | `"ctlog"` |  |
| ctlog.name | string | `"ctlog"` |  |
| ctlog.namespace.create | bool | `true` |  |
| ctlog.namespace.name | string | `"ctlog-system"` |  |
| forceNamespace | string | `""` |  |
| namespace.create | bool | `false` |  |
| namespace.name | string | `"fulcio-system"` |  |
| server.args.aws_hsm_root_ca_path | string | `nil` |  |
| server.args.certificateAuthority | string | `"fileca"` |  |
| server.args.gcp_private_ca_parent | string | `"projects/test/locations/us-east1/caPools/test"` |  |
| server.args.grpcPort | int | `5554` |  |
| server.args.hsm_caroot_id | string | `nil` |  |
| server.args.port | int | `5555` |  |
| server.grpcSvcPort | int | `5554` |  |
| server.image.pullPolicy | string | `"IfNotPresent"` |  |
| server.image.registry | string | `"gcr.io"` |  |
| server.image.repository | string | `"projectsigstore/fulcio"` |  |
| server.image.version | string | `"sha256:27c6e4fe64a72a537c133452d9c8e0518944d1d69aeee5e7ef8a9fbe70b8b5d3"` | v1.0.0 |
| server.ingress.grpc.annotations."nginx.ingress.kubernetes.io/backend-protocol" | string | `"GRPC"` |  |
| server.ingress.grpc.className | string | `""` |  |
| server.ingress.grpc.enabled | bool | `false` |  |
| server.ingress.grpc.hosts[0].host | string | `"fulcio.localhost"` |  |
| server.ingress.grpc.hosts[0].path | string | `"/dev.sigstore.fulcio.v2.CA"` |  |
| server.ingress.grpc.tls[0].hosts[0] | string | `"fulcio.localhost"` |  |
| server.ingress.grpc.tls[0].secretName | string | `"fulcio-grpc-ingress-tls"` |  |
| server.ingress.http.annotations | object | `{}` |  |
| server.ingress.http.className | string | `"nginx"` |  |
| server.ingress.http.enabled | bool | `true` |  |
| server.ingress.http.hosts[0].host | string | `"fulcio.localhost"` |  |
| server.ingress.http.hosts[0].path | string | `"/"` |  |
| server.ingress.http.tls | list | `[]` |  |
| server.logging.production | bool | `false` |  |
| server.name | string | `"server"` |  |
| server.replicaCount | int | `1` |  |
| server.resources | string | `""` |  |
| server.secret | string | `"fulcio-server-secret"` |  |
| server.securityContext.runAsNonRoot | bool | `true` |  |
| server.securityContext.runAsUser | int | `65533` |  |
| server.service.ports[0].name | string | `"http"` |  |
| server.service.ports[0].port | int | `80` |  |
| server.service.ports[0].protocol | string | `"TCP"` |  |
| server.service.ports[0].targetPort | int | `5555` |  |
| server.service.ports[1].name | string | `"grpc"` |  |
| server.service.ports[1].port | int | `5554` |  |
| server.service.ports[1].protocol | string | `"TCP"` |  |
| server.service.ports[1].targetPort | int | `5554` |  |
| server.service.ports[2].name | string | `"2112-tcp"` |  |
| server.service.ports[2].port | int | `2112` |  |
| server.service.ports[2].protocol | string | `"TCP"` |  |
| server.service.ports[2].targetPort | int | `2112` |  |
| server.service.type | string | `"ClusterIP"` |  |
| server.serviceAccount.annotations | object | `{}` |  |
| server.serviceAccount.create | bool | `true` |  |
| server.serviceAccount.mountToken | bool | `true` |  |
| server.serviceAccount.name | string | `""` |  |
| server.svcPort | int | `80` |  |

----------------------------------------------

## Ingress

To enabled access from external resources, an Ingress resource is created. The configuration necessary for each Ingress resource is primarily dependent on the specific Ingress Controller being used. In most cases, implementation specific configuration is specified as annotations on the Ingress resources. These can be applied using the `server.ingress.annotations` parameter.

> **Warning**: versions prior to `0.3.0` of this chart use different ingresses.
>
> In version `0.3.0` a second ingress is introduced. This ingress exposes the gRPC endpoint as introduced in v0.4.0 of Fulcio.
>
> The change in particular is the structure of the ingress values.
> Prior to `0.3.0`:
>
> ```shell
> server:
>   ingress:
>     enabled: true
>     hosts:
>       - host: fulcio.localhost
>         path: /
> ```
>
> Since `0.3.0`:
>
> ```shell
> server:
>   ingress:
>     http:
>       enabled: true
>       hosts:
>         - host: fulcio.localhost
>           path: /
>     grpc:
>       enabled: false
> ```
