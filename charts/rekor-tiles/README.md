# rekor-tiles

<!-- This README.md is generated. Please edit README.md.gotmpl -->

![Version: 1.3.2](https://img.shields.io/badge/Version-1.3.2-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 2.4.1](https://img.shields.io/badge/AppVersion-2.4.1-informational?style=flat-square)

Part of the sigstore project, Rekor v2 (Rekor on tiles) is a signature transparency log

**Homepage:** <https://sigstore.dev/>

## Quick Installation

To install the helm chart with default values run following command.
The [Values](#values) section describes the configuration options for this chart.

```shell
helm dependency update .
helm install [RELEASE_NAME] .
```

## Uninstallation

To uninstall the Helm chart run following command.

```shell
helm uninstall [RELEASE_NAME]
```

## Configuring a File Signer

If using --signer-filepath for rekor-tiles, create the Secret to read the signing key from:

```shell
kubectl create secret generic --from-literal signing-key=$(cat /path/to/private/key.pem) signing-key
```

If password encrypted, provide the password in secret:

```shell
kubectl create secret generic --from-literal signing-key=$(cat /path/to/private/key.pem) --from-literal password=foobar signing-key
```

If using Tink or another KMS, provide the KMS configuration through values.yaml.

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| The Sigstore Authors |  |  |

## Source Code

* <https://github.com/sigstore/rekor-tiles>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| fullnameOverride | string | `""` |  |
| image.awsSHA | string | `"sha256:4fb604d4a6b316fe482aa2fb7c4b9a31f76d10807c3c6f5e796f724287beeab6"` |  |
| image.flavor | string | `"gcp"` |  |
| image.gcpSHA | string | `"sha256:874b3aa6ea454e85f7366411479430c6d1183d664f31f917873c7772efc3d99d"` |  |
| image.gcpcloudsqlSHA | string | `"sha256:aec2d8751a53b3031cbceb62ff96ebc5463924e079379cff7a6c7bd7a456befc"` |  |
| image.posixSHA | string | `"sha256:42129c1803c1b90061a673230ad12e1efb78b6eb86ccc226c2b79bd94d3a281d"` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.registry | string | `"ghcr.io"` |  |
| image.repository | string | `"sigstore/rekor-tiles"` |  |
| image.version | string | `"v2.4.1"` |  |
| imagePullSecrets | list | `[]` |  |
| lifecycle.preStop.sleep.seconds | int | `15` |  |
| livenessProbe.httpGet.path | string | `"/healthz"` |  |
| livenessProbe.httpGet.port | int | `3000` |  |
| nameOverride | string | `""` |  |
| namespace.create | bool | `false` |  |
| namespace.name | string | `"rekor-tiles-system"` |  |
| neg.grpc.name | string | `""` |  |
| neg.grpc.port | int | `3001` |  |
| neg.http.name | string | `""` |  |
| neg.http.port | int | `80` |  |
| nodeSelector."iam.gke.io/gke-metadata-server-enabled" | string | `"true"` |  |
| platform | string | `"gke"` | Target platform. Only "gke" has any effect: it requires nodeSelector to set the GKE workload-identity key (iam.gke.io/gke-metadata-server-enabled). Any other value (e.g. "aws", "posix", "gcpcloudsql") is treated identically as non-GKE, and that nodeSelector key is not required. |
| podAnnotations | object | `{}` |  |
| podLabels | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| readinessProbe.httpGet.path | string | `"/healthz"` |  |
| readinessProbe.httpGet.port | int | `3000` |  |
| replicaCount | int | `1` |  |
| resources | object | `{}` |  |
| securityContext.allowPrivilegeEscalation | bool | `false` |  |
| securityContext.capabilities.drop[0] | string | `"ALL"` |  |
| securityContext.readOnlyRootFilesystem | bool | `true` |  |
| securityContext.runAsNonRoot | bool | `true` |  |
| securityContext.runAsUser | int | `65533` |  |
| server.antispam | object | `{}` |  |
| server.aws | object | `{}` |  |
| server.extraArgs | list | `[]` |  |
| server.extraEnv | list | `[]` |  |
| server.gcp | object | `{}` |  |
| server.gcpcloudsql | object | `{}` |  |
| server.grpc.port | string | `"3001"` |  |
| server.grpcSvcTLS | object | `{}` |  |
| server.hostname | string | `"localhost"` |  |
| server.http.metricsPort | string | `"2112"` |  |
| server.http.port | string | `"3000"` |  |
| server.identity | object | `{}` |  |
| server.posix | object | `{}` |  |
| server.readOnly | bool | `false` |  |
| server.serverConfig | object | `{}` |  |
| server.signer | object | `{}` |  |
| server.tesseraLifecycle | object | `{}` |  |
| server.witnessing | object | `{}` |  |
| service.ports[0].name | string | `"3000-tcp"` |  |
| service.ports[0].port | int | `80` |  |
| service.ports[0].protocol | string | `"TCP"` |  |
| service.ports[0].targetPort | int | `3000` |  |
| service.ports[1].name | string | `"3001-tcp"` |  |
| service.ports[1].port | int | `3001` |  |
| service.ports[1].protocol | string | `"TCP"` |  |
| service.ports[1].targetPort | int | `3001` |  |
| service.ports[2].name | string | `"metrics"` |  |
| service.ports[2].port | int | `2112` |  |
| service.ports[2].protocol | string | `"TCP"` |  |
| service.ports[2].targetPort | int | `2112` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.automount | bool | `true` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `""` |  |
| terminationGracePeriodSeconds | int | `65` |  |
| tolerations | list | `[]` |  |
