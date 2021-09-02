# Helm Charts

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
