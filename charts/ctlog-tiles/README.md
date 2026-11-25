# ctlog-tiles

<!-- This README.md is generated. Please edit README.md.gotmpl -->

![Version: 0.2.0](https://img.shields.io/badge/Version-0.2.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v0.1.2](https://img.shields.io/badge/AppVersion-v0.1.2-informational?style=flat-square)

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

## Using the AWS backend

In values.yaml, set `image.flavor` to `"aws"`. The chart omits its default GKE metadata-server node selector and GKE NEG
service annotation for the AWS flavor. Set `nodeSelector` explicitly if your
AWS nodes need a selector.

For static AWS credentials, create a Kubernetes Secret in the chart's namespace.
For EKS, prefer an IAM role attached to the service account and omit the
`credentials` block. For an S3-compatible service, create a separate Secret with
the signing key files; this avoids depending on AWS Secrets Manager:

```
kubectl -n ctlog-tiles-system create secret generic ctlog-tiles-db \
    --from-file=password=/path/to/database-password
kubectl -n ctlog-tiles-system create secret generic ctlog-tiles-aws \
    --from-file=AWS_ACCESS_KEY_ID=/path/to/access-key-id \
    --from-file=AWS_SECRET_ACCESS_KEY=/path/to/secret-access-key
kubectl -n ctlog-tiles-system create secret generic ctlog-tiles-signer \
    --from-file=public-key.pem=/path/to/public-key.pem \
    --from-file=private-key.pem=/path/to/private-key.pem
```

Configure the bucket, region, optional S3 endpoint, credentials Secret, database
connection, and file-based signer in values.yaml:

```
image:
  flavor: aws
nodeSelector: {}
serviceAccount:
  annotations:
    eks.amazonaws.com/role-arn: arn:aws:iam::123456789012:role/ctlog-tiles
server:
  aws:
    bucket: unique-tesseract-bucket-name
    region: us-east-1
    # Set this for S3-compatible services; omit for AWS S3.
    s3EndpointURL: https://s3.example.com
    # Set for S3-compatible services such as MinIO.
    usePathStyle: true
    credentials:
      secretKeyRef:
        name: ctlog-tiles-aws
        accessKeyIdKey: AWS_ACCESS_KEY_ID
        secretAccessKeyKey: AWS_SECRET_ACCESS_KEY
        # Optional; use when the credentials are temporary STS credentials.
        # sessionTokenKey: AWS_SESSION_TOKEN
    signer:
      files:
        secret:
          name: ctlog-tiles-signer
          publicKey: public-key.pem
          privateKey: private-key.pem
          mountPath: /etc/ctfe/signer
    database:
      name: sequencer
      host: tesseract-db.cluster-xxxxxxxxxxxx.us-east-1.rds.amazonaws.com
      port: 3306
      user: tesseract
      password:
        secretKeyRef:
          name: ctlog-tiles-db
          key: password
```

All referenced Kubernetes Secrets must exist before deploying the chart. AWS
credentials and the database password are not stored in Helm values. The signer
file Secret is mounted read-only and the paths are passed to Tesseract as
`--signer_public_key_file` and `--signer_private_key_file`. For AWS deployments
that use AWS Secrets Manager instead, replace `signer.files` with `signer` key
names (`publicKey` and `privateKey`) and grant the AWS role access to those
secrets. For EKS with an IAM role, omit `credentials` and rely on the AWS
credential provider chain. If using temporary credentials, include the
`AWS_SESSION_TOKEN` key in the credentials Secret and set `sessionTokenKey` to
that key. The chart sets `AWS_REGION` and `AWS_DEFAULT_REGION`; Tesseract reads a
custom S3 endpoint from `AWS_ENDPOINT_URL_S3`.

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
| image.awsSHA | string | `"sha256:3f62d509f704ec50ef7288eefa8f6044b15b453c8f4bec346a8006378b726f1d"` |  |
| image.flavor | string | `"posix"` |  |
| image.gcpSHA | string | `"sha256:37f1e3fb7f511f8c4bacec43e22fb52fb631f77fadb10de8bbf1560594c96fbe"` |  |
| image.posixSHA | string | `"sha256:b044edd2388857dfc590381ff526214dfea93c6eeb61f632e58633cac2330935"` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.registry | string | `"ghcr.io"` |  |
| image.repository | string | `"transparency-dev/tesseract"` |  |
| image.version | string | `"v0.1.2"` |  |
| imagePullSecrets | list | `[]` |  |
| lifecycle.preStop.sleep.seconds | int | `15` |  |
| livenessProbe.httpGet.path | string | `"/healthz"` |  |
| livenessProbe.httpGet.port | int | `6962` |  |
| nameOverride | string | `""` |  |
| namespace.create | bool | `false` |  |
| namespace.name | string | `"ctlog-tiles-system"` |  |
| neg.http.name | string | `""` |  |
| neg.http.port | int | `80` |  |
| nodeSelector | object | `{}` |  |
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
| server.aws | object | `{}` |  |
| server.extraArgs | list | `[]` |  |
| server.extraEnv | list | `[]` |  |
| server.fulcio.configMap.key | string | `"fulcio"` |  |
| server.fulcio.configMap.mountPath | string | `"/etc/fulcio"` |  |
| server.fulcio.configMap.mountSubPath | string | `"roots.pem"` |  |
| server.fulcio.configMap.name | string | `"fulcio-roots"` |  |
| server.fulcio.path | string | `"/etc/fulcio/roots.pem"` |  |
| server.fulcio.rootPEM | string | `""` |  |
| server.gcp | object | `{}` |  |
| server.hostname | string | `"localhost"` |  |
| server.http.port | string | `"6962"` |  |
| server.logLevel | string | `"0"` |  |
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
