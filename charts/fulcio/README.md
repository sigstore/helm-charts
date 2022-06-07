# fulcio

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

## Parameters

The following table lists the configurable parameters of the Fulcio chart and their default values.

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| config.contents.MetaIssuers."https://kubernetes.*.svc".ClientID | string | `"sigstore"` |  |
| config.contents.MetaIssuers."https://kubernetes.*.svc".Type | string | `"kubernetes"` |  |
| config.contents.OIDCIssuers."https://kubernetes.default.svc".ClientID | string | `"sigstore"` |  |
| config.contents.OIDCIssuers."https://kubernetes.default.svc".IssuerURL | string | `"https://kubernetes.default.svc"` |  |
| config.contents.OIDCIssuers."https://kubernetes.default.svc".Type | string | `"kubernetes"` |  |
| createcerts.enabled | bool | `true` |  |
| createcerts.image.pullPolicy | string | `"IfNotPresent"` |  |
| createcerts.image.registry | string | `"ghcr.io"` |  |
| createcerts.image.repository | string | `"sigstore/scaffolding/createcerts"` |  |
| createcerts.image.version | string | `"sha256:73e7ac35d0e5169bd14a5cb6caed2e7d44277dec3d1de92e08f4d055523089a1"` |  |
| createcerts.name | string | `"createcerts"` |  |
| createcerts.replicaCount | int | `1` |  |
| createcerts.serviceAccount.annotations | object | `{}` |  |
| createcerts.serviceAccount.create | bool | `true` |  |
| createcerts.serviceAccount.mountToken | bool | `true` |  |
| createcerts.serviceAccount.name | string | `""` |  |
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
| server.args.kms_resource | string | `nil` | URI for KMS backend if using `kmsca` certificate authority |
| server.args.kms_cert_chain | string | `nil` | PEM encoded certificate chain if using `kmsca` certificate authority |
| server.args.gcp_private_ca_parent | string | `"projects/test/locations/us-east1/caPools/test"` |  |
| server.args.hsm_caroot_id | string | `nil` |  |
| server.args.port | int | `5555` |  |
| server.image.pullPolicy | string | `"IfNotPresent"` |  |
| server.image.registry | string | `"gcr.io"` |  |
| server.image.repository | string | `"projectsigstore/fulcio"` |  |
| server.image.version | string | `"sha256:c0e8d940ec4ca6b474af9f7a04e05787677ec5bb3db12444ba69c89818ecfdd5"` |  |
| server.ingress.grpc.annotations | object | `{}` |  |
| server.ingress.grpc.className | object | `""` |  |
| server.ingress.grpc.enabled | bool | `true` |  |
| server.ingress.grpc.hosts | array | [] |  |
| server.ingress.grpc.hosts.host | string |  |  |
| server.ingress.grpc.hosts.path | string | `"/"` |  |
| server.ingress.grpc.hosts.service_name | string |  |  |
| server.ingress.grpc.tls | array | `[]` |  |
| server.ingress.grpc.tls.hosts | array | `[]` |  |
| server.ingress.grpc.tls.secretName | string | `` |  |
| server.ingress.http.annotations | object | `{}` |  |
| server.ingress.http.className | object | `""` |  |
| server.ingress.http.enabled | bool | `true` |  |
| server.ingress.http.hosts | array | [] |  |
| server.ingress.http.hosts.host | string |  |  |
| server.ingress.http.hosts.path | string | `"/"` |  |
| server.ingress.http.hosts.service_name | string |  |  |
| server.ingress.http.tls | array | `[]` |  |
| server.ingress.http.tls.hosts | array | `[]` |  |
| server.ingress.http.tls.secretName | string | `` |  |
| server.replicaCount | int | `1` |  |
| server.service.ports[0].name | string | `"80-tcp"` |  |
| server.service.ports[0].port | int | `80` |  |
| server.service.ports[0].protocol | string | `"TCP"` |  |
| server.service.ports[0].targetPort | int | `5555` |  |
| server.service.type | string | `"ClusterIP"` |  |
| server.serviceAccount.annotations | object | `{}` |  |
| server.serviceAccount.create | bool | `true` |  |
| server.serviceAccount.mountToken | bool | `true` |  |
| server.serviceAccount.name | string | `""` |  |
| server.svcPort | int | `80` |  |

----------------------------------------------

## Ingress

To enabled access from external resources, an Ingress resource is created. The configuration necessary for each Ingress resource is primarily dependent on the specific Ingress Controller being used. In most cases, implementation specific configuration is specified as annotations on the Ingress resources. These can be applied using the `server.ingress.annotations` parameter.
