# Helm Charts

[![Artifact Hub](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/sigstore)](https://artifacthub.io/packages/search?repo=sigstore)

[Helm](https://helm.sh) Charts to support the [Sigstore](https://sigstore.dev) project.

## Usage

Charts are available in the following formats:

* [Chart Repository](https://helm.sh/docs/topics/chart_repository/)
* [OCI Artifacts](https://helm.sh/docs/topics/registries/)

## Contribute

:heart: Planning to contribute to this project ? Please follow our [contributing guidelines](CONTRIBUTING.md) to have your contributions smoothly flowing into this project.

## Prerequisites

- [Kubernetes](https://kubernetes.io/)
- [Helm3](https://helm.sh/)

### Installing from the Chart Repository

The following command can be used to add the chart repository:

```shell
helm repo add sigstore https://sigstore.github.io/helm-charts
helm repo update
```

Once the chart is added, install one of the available [Helm chart](https://github.com/Sagar2366/sigstore-helm-charts/tree/main/charts):

```shell
helm upgrade -i <release_name> sigstore/<chart_name>
```

### Installing from an OCI Registry

Charts are also available in OCI format. The list of available charts can be found [here](https://github.com/sigstore?tab=packages&repo_name=helm-charts).

Install one of the available charts:

```shell
helm upgrade -i oci://ghcr.io/sigstore/helm-charts/<chart_name> --version=<version>
```

## Provenance

Charts are signed using the [provenance methods provided by the Helm project](https://helm.sh/docs/topics/provenance/) as well as uploaded to the [Rekor transparency server](https://github.com/sigstore/rekor) using the [Helm sigtore plugin](https://github.com/sigstore/helm-sigstore).

Verification of the signed charts can be accomplished by importing the GPG Public Key that was used to sign the associated chart.

```shell
cat security/pubkey.gpg | gpg --import --batch
```

Once the public key has been imported, charts can be verified using the `helm verify` and/or `helm sigstore verify` commands.

NOTE: The public key that was used to sign a particular chart may not be identical to the public key on the `main` branch. Each chart release has an associated git tag. The public key that was used to sign the particular chart will be included in this tag.

## Charts

* [common](charts/common)
* [ctlog](charts/ctlog)
* [fulcio](charts/fulcio)
* [policy-controller](charts/policy-controller)
* [rekor](charts/rekor)
* [scaffold](charts/scaffold)
* [sigstore-prober](charts/sigstore-prober)
* [trillian](charts/trillian)
* [updatetree](charts/updatetree)
