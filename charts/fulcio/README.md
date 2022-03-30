# fulcio

[Fulcio](https://docs.sigstore.dev/fulcio/overview/) is a free code signing Certificate Authority, built to make short-lived certificates available to anyone.

The following components are also included as either direct components or through chart dependencies:

* ctlog

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
| createcerts.image.version | string | `"sha256:46a355b021a9613b4ba578e92743e884e4567407b2b84e401343708c92b8b72e"` |  |
| createcerts.name | string | `"createcerts"` |  |
| createcerts.replicaCount | int | `1` |  |
| createcerts.serviceAccount.annotations | object | `{}` |  |
| createcerts.serviceAccount.create | bool | `true` |  |
| createcerts.serviceAccount.mountToken | bool | `true` |  |
| createcerts.serviceAccount.name | string | `""` |  |
| ctlog.createcerts.fullnameOverride | string | `"ctlog-createcerts"` |  |
| ctlog.createcerts.name | string | `"ctlog-createcerts"` |  |
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
| server.args.hsm_caroot_id | string | `nil` |  |
| server.args.port | int | `5555` |  |
| server.image.pullPolicy | string | `"IfNotPresent"` |  |
| server.image.registry | string | `"gcr.io"` |  |
| server.image.repository | string | `"projectsigstore/fulcio"` |  |
| server.image.version | string | `"sha256:66870bd6b111f3c5478703a8fb31c062003f0127b2c2c5e49ccd82abc4ec7841"` |  |
| server.ingress.annotations | object | `{}` |  |
| server.ingress.enabled | bool | `true` |  |
| server.ingress.hosts | array | [] |  |
| server.ingress.hosts.host | string |  |  |
| server.ingress.hosts.path | string | `"/"` |  |
| server.ingress.hosts.service_name | string |  |  |
| server.ingress.tls | array | `[]` |  |
| server.ingress.tls.hosts | array | `[]` |  |
| server.ingress.tls.secretName | string | `` |  |
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
