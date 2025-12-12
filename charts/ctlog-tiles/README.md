# ctlog-tiles

<!-- This README.md is generated. Please edit README.md.gotmpl -->

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v0.1.1](https://img.shields.io/badge/AppVersion-v0.1.1-informational?style=flat-square)

Tiles-based certificate log (TesseraCT)

**Homepage:** <https://sigstore.dev>

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

## Specifying Fulcio roots

Unlike the ctlog chart, there is no createctconfig job that runs and fetches Fulcio's roots from the rootCert endpoint. The roots need to be known ahead of time and specified directly in values.yaml:

```
server:
  ...
  fulcio:
    rootPEM: |-
      -----BEGIN CERTIFICATE-----
      ...
```

## Using the POSIX backend

In values.yaml, set `image.flavor` to `"posix"` (default).

Create a secret for the private key:

```
openssl ecparam -name prime256v1 -genkey -noout -out /path/to/privkey.pem
kubectl -n ctlog-tiles-system create secret generic ctlog-signing-key --from-file=signing-key=/path/to/privkey.pem
```

Encrypted secret keys are not supported.

Configure the private key and storage directory in values.yaml:

```
server:
  ...
  posix:
    privateKey:
      path: /etc/ctfe/signer.pem
      secret:
        name: signing-key
        key: signing-key
        mountPath: /etc/ctfe
        mountSubPath: signer.pem
    storageDir:
      path: /storage
      name: ctlog
      volume:
        hostPath:
          path: /data/ctlog-storage
          type: Directory
```

## Using the GCP backend

The deployment needs to be running in a GKE cluster with workload identity
enabled and with permission to access secrets, storage objects, and Spanner
databases.

In values.yaml, set `image.flavor` to `"gcp"`.

Create a Spanner instance and database in GCP:

```
gcloud spanner instances create tesseract \
    --config=regional-us-west1 \
    --description="test" --nodes=1
gcloud spanner databases create sequencer --instance tesseract
# If using antispam, create the antispam database too:
# gcloud spanner databases create antispam --instance tesseract
```

Create a GCS bucket:

```
gcloud storage buckets create gs://unique-tesseract-bucket-name
```

Create secrets in Secret Manager for both the private and public keys:

```
gcloud secrets create tesseract-private --data-file=/path/to/privkey.pem
gcloud secrets create tesseract-public --data-file=/path/to/pubkey.pem
```

Configure the Spanner path, bucket, and signer keys in values.yaml:

```
server:
  ...
  gcp:
    spanner: projects/my-project/instances/tesseract/databases/sequencer
    bucket: unique-tesseract-bucket-name
    signer:
      privateKey: projects/1234/secrets/tesseract-private/versions/1
      publicKey: projects/1234/secrets/tesseract-public/versions/1
```

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| The Sigstore Authors |  |  |

## Source Code

* <https://github.com/transparency-dev/tesseract>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| fullnameOverride | string | `""` |  |
| image.flavor | string | `"posix"` |  |
| image.gcpSHA | string | `"sha256:17d3788b736de01ab0586359626c01789910a6e2981e7b90014fbda8689f5017"` |  |
| image.posixSHA | string | `"sha256:767c2dbe4a83be9243246564244aa381322f08f2a864371f62b880c465033815"` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.registry | string | `"ghcr.io"` |  |
| image.repository | string | `"sigstore/scaffolding/tesseract"` |  |
| image.version | string | `"v0.1.1"` |  |
| imagePullSecrets | list | `[]` |  |
| lifecycle.preStop.exec.command[0] | string | `"sleep"` |  |
| lifecycle.preStop.exec.command[1] | string | `"15"` |  |
| livenessProbe.httpGet.path | string | `"/healthz"` |  |
| livenessProbe.httpGet.port | int | `6962` |  |
| nameOverride | string | `""` |  |
| namespace.create | bool | `false` |  |
| namespace.name | string | `"ctlog-tiles-system"` |  |
| neg.http.name | string | `""` |  |
| neg.http.port | int | `80` |  |
| nodeSelector."iam.gke.io/gke-metadata-server-enabled" | string | `"true"` |  |
| podAnnotations | object | `{}` |  |
| podLabels | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| readinessProbe.httpGet.path | string | `"/healthz"` |  |
| readinessProbe.httpGet.port | int | `6962` |  |
| replicaCount | int | `1` |  |
| resources | object | `{}` |  |
| securityContext.allowPrivilegeEscalation | bool | `false` |  |
| securityContext.capabilities.drop[0] | string | `"ALL"` |  |
| securityContext.readOnlyRootFilesystem | bool | `true` |  |
| securityContext.runAsNonRoot | bool | `true` |  |
| securityContext.runAsUser | int | `65533` |  |
| server.antispam | object | `{}` |  |
| server.extraArgs | list | `[]` |  |
| server.fulcio.configMap.key | string | `"fulcio"` |  |
| server.fulcio.configMap.mountPath | string | `"/etc/fulcio"` |  |
| server.fulcio.configMap.mountSubPath | string | `"roots.pem"` |  |
| server.fulcio.configMap.name | string | `"fulcio-roots"` |  |
| server.fulcio.path | string | `"/etc/fulcio/roots.pem"` |  |
| server.fulcio.rootPEM | string | `""` |  |
| server.gcp | object | `{}` |  |
| server.hostname | string | `"localhost"` |  |
| server.http.port | string | `"6962"` |  |
| server.logLevel | string | `"1"` |  |
| server.posix | object | `{}` |  |
| server.serverConfig | object | `{}` |  |
| server.tesseraLivecycle | object | `{}` |  |
| server.witnessing | object | `{}` |  |
| service.ports[0].name | string | `"6962-tcp"` |  |
| service.ports[0].port | int | `80` |  |
| service.ports[0].protocol | string | `"TCP"` |  |
| service.ports[0].targetPort | int | `6962` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.automount | bool | `true` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `""` |  |
| terminationGracePeriodSeconds | int | `65` |  |
| tolerations | list | `[]` |  |
