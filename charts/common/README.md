# common

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: library](https://img.shields.io/badge/Type-library-informational?style=flat-square)

A Library Helm Chart containing common logic for use by Sigstore charts

**Homepage:** <https://sigstore.dev/>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| The Sigstore Authors |  |  |

----------------------------------------------


## Named Templates

### Images

| Name                  | Description                                                                      |      Expected Input                |
|-----------------------|----------------------------------------------------------------------------------|------------------------------------|
| `common.images.image` | Create a fully qualified image reference. see [Image](#image) for the structure. | `.Values.image` Reference to Image |

### Labels

| Name                           | Description                                 | Expected Input        |
|--------------------------------|---------------------------------------------|-----------------------|
| `common.labels.labels`         | Returns standard Kubernetes labels          | `.` Chart context     |
| `common.labels.selectorLabels` | Returns specific labels used for selectors  | `.` Chart context     |
| `common.labels.labelsNameSuffix` | Returns the provided set of labels give the label key `app.kubernetes.io/name` appended with a provided suffix  | `dict "labels" "labels-content "suffix" "suffix-value"`     |

### Names

| Name                              | Description                                                                                       | Expected Input                                       |
|-----------------------------------|---------------------------------------------------------------------------------------------------|------------------------------------------------------|
| `common.names.name`               | Returns the name of the chart                                                                     | `.` Chart context                                    |
| `common.names.chart`              | Returns the name of the chart used by the chart label                                             | `.` Chart context                                    |
| `common.names.fullname`           | Returns the fully qualified application name                                                      | `.` Chart context                                    |
| `common.names.managedfullname`    | Returns the fully qualified application name by providing a context to use                        | `dict "content" .Values.content "context" $`         |
| `common.names.fullnameSuffix`     | Returns the fully qualified application name appended by a provided suffix                        | `dict "suffix" "suffix-value "context" $`            |
| `common.names.rawnamespace`       | Returns the raw namespace if set with forceNamespace or .Release.Namespace is set                 | `.` Chart context                                    |
| `common.names.serviceAccountName` | Returns the name of the Service account. See [ServiceAccount](#serviceaccount) for the structure. | `.Values.serviceAccount` Reference to ServiceAccount |

### Network

| Name                           | Description                                 | Expected Input        |
|--------------------------------|---------------------------------------------|-----------------------|
| `common.network.containerPorts`         | Returns the `containerPorts` property of a PodSpec         | `dict` containing `port`, `targetPort` and optional `protocol`     |


## Input Schemas 

The following are a set of schemas that are expected within applicable Named Templates

### Image

```yaml
registry:
  type: string
  description: Registry where the image is located
  example: gcr.io

repository:
  type: string
  description: Repository and image name
  example: sigstore/scaffolding/ct_server

version:
  type: string
  description: image tag or digest
  example: 1.0.0
```

### ServiceAccount

```yaml
name:
  type: string
  description: Name of the ServiceAccount
  example: myApp

create:
  type: boolean
  description: Create a dedicated ServiceAccount
  example: true
```
