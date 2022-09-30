# fulcio

![Version: 0.4.11](https://img.shields.io/badge/Version-0.4.11-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.5.3](https://img.shields.io/badge/AppVersion-0.5.3-informational?style=flat-square)

[Fulcio](https://docs.sigstore.dev/fulcio/overview/) is a free code signing Certificate Authority, built to make short-lived certificates available to anyone.

The following components are also included as either direct components or through chart dependencies:

* ctlog

## *NOTE* 0.3.0 NOT backwards compatible

In version 0.3.0, we will be introducing a second ingress in support of the new gRPC endpoint as introduced in v0.4.0 of Fulcio.

The change in particular is the structure of the ingress values.

Previously
```shell
server:
  ingress:
    enabled: true
    hosts:
      - host: fulcio.localhost
        path: /
```

Now
```shell
server:
  ingress:
    http:
      enabled: true
      hosts:
        - host: fulcio.localhost
          path: /
    grpc:
      enabled: false
```

## Quick Installation

```shell
helm dependency update .
helm install [RELEASE_NAME] .
```

This command deploys the default configuration for the Fulcio chart. The [Parameters] section describes the various ways in which the chart can be configured.

## Uninstallation

```shell
helm uninstall [RELEASE_NAME]
```

The previous command removes the previously installed chart.

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://sigstore.github.io/helm-charts | ctlog | 0.2.27 |

## Parameters

The following table lists the configurable parameters of the Fulcio chart and their default values.

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| config.contents | object | `{}` |  |
| createcerts.enabled | bool | `true` |  |
| createcerts.image.pullPolicy | string | `"IfNotPresent"` |  |
| createcerts.image.registry | string | `"ghcr.io"` |  |
| createcerts.image.repository | string | `"sigstore/scaffolding/createcerts"` |  |
| createcerts.image.version | string | `"sha256:73e7ac35d0e5169bd14a5cb6caed2e7d44277dec3d1de92e08f4d055523089a1"` |  |
| createcerts.name | string | `"createcerts"` |  |
| createcerts.replicaCount | int | `1` |  |
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
| server.args.kms_resource | string | `nil` | URI for KMS backend if using `kmsca` certificate authority |
| server.args.kms_cert_chain | string | `nil` | PEM encoded certificate chain if using `kmsca` certificate authority |
| server.args.port | int | `5555` |  |
| server.grpcSvcPort | int | `5554` |  |
| server.image.pullPolicy | string | `"IfNotPresent"` |  |
| server.image.registry | string | `"gcr.io"` |  |
| server.image.repository | string | `"projectsigstore/fulcio"` |  |
| server.image.version | string | `"sha256:5d16364a5be4e75c98672f789d44ab4775554fe189a6217725a63a06de6fbc42"` | `v0.6.0` |
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
| server.name | string | `"server"` |  |
| server.replicaCount | int | `1` |  |
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

Autogenerated from chart metadata using [helm-docs v1.11.0](https://github.com/norwoodj/helm-docs/releases/v1.11.0)
