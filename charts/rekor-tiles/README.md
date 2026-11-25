# rekor-tiles

<!-- This README.md is generated. Please edit README.md.gotmpl -->

![Version: 1.3.7](https://img.shields.io/badge/Version-1.3.7-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 2.4.7](https://img.shields.io/badge/AppVersion-2.4.7-informational?style=flat-square)

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
| image.awsSHA | string | `"sha256:e8265beb6fc7ee49feca4fe8a10a239050d00f2963a810018d76746de721bf4e"` |  |
| image.flavor | string | `"gcp"` |  |
| image.gcpSHA | string | `"sha256:027075bceec28bb2f1e7462728c07b8c2d076f52fe8a325ce3a41672599aa96f"` |  |
| image.gcpcloudsqlSHA | string | `"sha256:ba5b8e87c11ffccb9051e60d67575ea1aca35da4d7c19d58de5e85c8b50f81ee"` |  |
| image.posixSHA | string | `"sha256:794faeab38c604f69653d588cdd57a266905cc32f779774c83926880c6f8120d"` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.registry | string | `"ghcr.io"` |  |
| image.repository | string | `"sigstore/rekor-tiles"` |  |
| image.version | string | `"v2.4.7"` |  |
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
