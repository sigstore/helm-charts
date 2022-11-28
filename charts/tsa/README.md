# tsa

<!-- This README.md is generated. Please edit README.md.gotmpl -->

![Version: 0.0.1](https://img.shields.io/badge/Version-0.0.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.1.2](https://img.shields.io/badge/AppVersion-0.1.2-informational?style=flat-square)

Timestamp Authority issuing RFC3161 signed timestamps.

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

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| forceNamespace | string | `""` |  |
| namespace.create | bool | `false` |  |
| namespace.name | string | `"tsa-system"` |  |
| server.args.cert_chain | string | `nil` |  |
| server.args.kms_key_resource | string | `"gcpkms://resource"` |  |
| server.args.port | int | `5555` |  |
| server.args.signer | string | `"tink"` |  |
| server.args.tink_enc_keyset | string | `nil` |  |
| server.args.tink_hcvault_token | string | `nil` |  |
| server.args.tink_key_resource | string | `nil` |  |
| server.grpcSvcPort | int | `5554` |  |
| server.image.pullPolicy | string | `"IfNotPresent"` |  |
| server.image.registry | string | `"ghcr.io"` |  |
| server.image.repository | string | `"sigstore/timestamp-server"` |  |
| server.image.version | string | `"sha256:6d923276ff81b814c99d8c901184ebb8b9a0411eacf61d9fe0b26fce68e5a5ee"` | v0.1.2 |
| server.ingress.http.annotations | object | `{}` |  |
| server.ingress.http.className | string | `"nginx"` |  |
| server.ingress.http.enabled | bool | `true` |  |
| server.ingress.http.hosts[0].host | string | `"timestamp.localhost"` |  |
| server.ingress.http.hosts[0].path | string | `"/"` |  |
| server.ingress.http.tls | list | `[]` |  |
| server.logging.production | bool | `false` |  |
| server.name | string | `"server"` |  |
| server.replicaCount | int | `1` |  |
| server.secret | string | `"tsa-server-secret"` |  |
| server.securityContext.runAsNonRoot | bool | `true` |  |
| server.securityContext.runAsUser | int | `65533` |  |
| server.service.ports[0].name | string | `"http"` |  |
| server.service.ports[0].port | int | `80` |  |
| server.service.ports[0].protocol | string | `"TCP"` |  |
| server.service.ports[0].targetPort | int | `5555` |  |
| server.service.ports[1].name | string | `"metrics"` |  |
| server.service.ports[1].port | int | `2112` |  |
| server.service.ports[1].protocol | string | `"TCP"` |  |
| server.service.ports[1].targetPort | int | `2112` |  |
| server.service.type | string | `"ClusterIP"` |  |
| server.serviceAccount.annotations | object | `{}` |  |
| server.serviceAccount.create | bool | `true` |  |
| server.serviceAccount.mountToken | bool | `true` |  |
| server.serviceAccount.name | string | `""` |  |
| server.svcPort | int | `80` |  |

----------------------------------------------

## Ingress

To enabled access from external resources, an Ingress resource is created. The configuration necessary for each Ingress resource is primarily dependent on the specific Ingress Controller being used. In most cases, implementation specific configuration is specified as annotations on the Ingress resources. These can be applied using the `server.ingress.annotations` parameter.

>
> ```shell
> server:
>   ingress:
>     http:
>       enabled: true
>       hosts:
>         - host: timestamp.localhost
>           path: /
> ```

## Quick Installation

To install the helm chart with default values run following command.
The [Values](#Values) section describes the configuration options for this chart.

```shell
helm dependency update .
helm install [RELEASE_NAME] . --set server.args.tink_key_resource=<TINK_KEY_RESOURCE>
```

## Uninstallation

To uninstall the Helm chart run following command.

```shell
helm uninstall [RELEASE_NAME]
```
