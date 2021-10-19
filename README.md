# Helm Charts

[![Artifact Hub](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/sigstore)](https://artifacthub.io/packages/search?repo=sigstore)

[Helm](https://helm.sh) Charts to support the [Sigstore](https://sigstore.dev) project.


## Adding the Chart Repository

The following command can be used to add the chart repository:

```shell
$ helm repo add sigstore https://sigstore.github.io/helm-charts
$ helm repo update
```

## Charts

* [rekor](charts/rekor)
* [cosigned](charts/cosigned)
