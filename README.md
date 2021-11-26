# Helm Charts

[![Artifact Hub](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/sigstore)](https://artifacthub.io/packages/search?repo=sigstore)

[Helm](https://helm.sh) Charts to support the [Sigstore](https://sigstore.dev) project.


## Usage

Charts are available in the following formats:

* [Chart Repository](https://helm.sh/docs/topics/chart_repository/)
* [OCI Artifacts](https://helm.sh/docs/topics/registries/)

### Installing from the Chart Repository

The following command can be used to add the chart repository:

```shell
$ helm repo add sigstore https://sigstore.github.io/helm-charts
$ helm repo update
```

Once the chart has been added, install one of the available charts:

```shell
$ helm upgrade -i <release_name> sigstore/<chart_name>
```

### Installing from an OCI Registry

Charts are also available in OCI format. The list of available charts can be found [here](https://github.com/sigstore?tab=packages&repo_name=helm-charts).

Install one of the available charts:

```shell
$ helm upgrade -i oci://ghcr.io/sigstore/helm-charts/<chart_name> --version=<version>
```

## Charts

* [rekor](charts/rekor)
* [cosigned](charts/cosigned)
