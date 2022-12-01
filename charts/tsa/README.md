# tsa

<!-- This README.md is generated. Please edit README.md.gotmpl -->

![Version: 0.0.1](https://img.shields.io/badge/Version-0.0.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.1.3](https://img.shields.io/badge/AppVersion-0.1.3-informational?style=flat-square)

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
| server.env | object | `{}` |  |
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
| server.image.version | string | `"sha256:09ecc219c4b279d6b5652a80d4d2201f55178e2cb233462da085ef3799acb823"` | v0.1.3 |
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

For testing the TSA (the memory signer MUST NOT be used for production):

```shell
helm dependency update .
helm install [RELEASE_NAME] . --set server.args.signer=memory
```

`helm upgrade` should be used for updates to the configuration.

### Tink Installation

[Tink](https://github.com/google/tink) is an easy-to-use cross-language crypto library.
The Timestamp Authority provides a signer that uses Tink, which enables in-memory signing
with secure on-disk key storage. Instead of being password-protected, the key is encrypted
with a cloud KMS key, and decrypted on startup.

Install [tinkey](https://github.com/google/tink/blob/master/docs/TINKEY.md) first.

Create a cloud KMS key in either GCP, AWS, or Vault, that will be used to encrypt a
signing key that is generated locally.

Run the following to create the local encrypted signing key, changing key URI and the key template if desired:

```shell
tinkey create-keyset --key-template ECDSA_P384 --out enc-keyset.cfg --master-key-uri gcp-kms://path-to-key
```

Generate a certificate chain, which must include a leaf certificate whose public key pairs to the private key
in the Tink keyset, may include any number of intermediate certificates, and must include a root certificate.
We recommend reviewing the [code](https://github.com/sigstore/timestamp-authority/blob/main/cmd/fetch-tsa-certs/fetch_tsa_certs.go)
used to generate the certificate chain if you do not want to use GCP. If you are using GCP:
* Create a root CA with [GCP CA Service](https://cloud.google.com/certificate-authority-service). Configure lifetime, and other defaults
  can remain. You will need to first create a CA pool, and then create one CA in that pool. 
* Create an asymmetric signing key on KMS that will be used as an intermediate CA to sign the TSA certificate.
* Run the following:

```shell
go run cmd/fetch-tsa-certs/fetch_tsa_certs.go \
  --intermediate-kms-resource="gcpkms://asymmetric-kms-key"\
  --tink-kms-resource="gcp-kms://tink-encryption-key"\
  --gcp-ca-parent="projects/<project>/locations/<location>/caPools/<pool-name>"\
  --tink-keyset-path="enc-keyset.cfg"\
  --output="chain.crt.pem"
```

Authenticating to KMS from your cluster will depend on your environment. For a local test setup,
you may need to run `gcloud auth application-default login`,
add the credentials to the configmap (`cloud_credentials: {{.Values.server.args.creds | quote }}`),
and add an environment variable to `server.env` that sets where the credentials are stored
(`GOOGLE_APPLICATION_CREDENTIALS: /etc/tsa-config/cloud_credentials`).

```shell
helm install [RELEASE_NAME] . --set server.args.signer=tink\
  --set server.args.tink_key_resource="gcp-kms://projects/hblauzvern-test-1/locations/us-west1/keyRings/test-ring-local/cryptoKeys/test-key"\
  --set server.args.cert_chain="$(cat chain.crt.pem)"\
  --set server.args.tink_enc_keyset="$(printf "%q" "$(cat enc-keyset.cfg)")"
```

## Uninstallation

To uninstall the Helm chart run following command.

```shell
helm uninstall [RELEASE_NAME]
```
