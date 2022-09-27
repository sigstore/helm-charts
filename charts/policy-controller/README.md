# policy-controller

![Version: 0.2.4](https://img.shields.io/badge/Version-0.2.4-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.3.0](https://img.shields.io/badge/AppVersion-0.3.0-informational?style=flat-square)

The Helm chart for Policy  Controller

**Homepage:** <https://github.com/sigstore/policy-controller>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| dlorenc |  |  |
| hectorj2f |  |  |

## Source Code

* <https://github.com/sigstore/policy-controller>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| commonNodeSelector | object | `{}` |  |
| commonTolerations | list | `[]` |  |
| cosign.cosignPub | string | `""` |  |
| cosign.secretKeyRef.name | string | `""` |  |
| cosign.webhookName | string | `"policy.sigstore.dev"` |  |
| imagePullSecrets | list | `[]` |  |
| policywebhook.env | object | `{}` |  |
| policywebhook.extraArgs | object | `{}` |  |
| policywebhook.image.pullPolicy | string | `"IfNotPresent"` |  |
| policywebhook.image.repository | string | `"ghcr.io/sigstore/policy-controller/policy-webhook"` |  |
| policywebhook.image.version | string | `"sha256:d1e7af59381793687db4673277005276eb73a06cf555503138dd18eaa1ca47d6"` |  |
| policywebhook.podSecurityContext.allowPrivilegeEscalation | bool | `false` |  |
| policywebhook.podSecurityContext.capabilities.drop[0] | string | `"all"` |  |
| policywebhook.podSecurityContext.enabled | bool | `true` |  |
| policywebhook.podSecurityContext.readOnlyRootFilesystem | bool | `true` |  |
| policywebhook.podSecurityContext.runAsNonRoot | bool | `true` |  |
| policywebhook.replicaCount | int | `1` |  |
| policywebhook.resources.limits.cpu | string | `"100m"` |  |
| policywebhook.resources.limits.memory | string | `"256Mi"` |  |
| policywebhook.resources.requests.cpu | string | `"100m"` |  |
| policywebhook.resources.requests.memory | string | `"128Mi"` |  |
| policywebhook.securityContext.enabled | bool | `false` |  |
| policywebhook.securityContext.runAsUser | int | `65532` |  |
| policywebhook.service.annotations | object | `{}` |  |
| policywebhook.service.port | int | `443` |  |
| policywebhook.service.type | string | `"ClusterIP"` |  |
| policywebhook.serviceAccount.annotations | object | `{}` |  |
| policywebhook.webhookNames.defaulting | string | `"defaulting.clusterimagepolicy.sigstore.dev"` |  |
| policywebhook.webhookNames.validating | string | `"validating.clusterimagepolicy.sigstore.dev"` |  |
| serviceMonitor.enabled | bool | `false` |  |
| webhook.env | object | `{}` |  |
| webhook.extraArgs | object | `{}` |  |
| webhook.image.pullPolicy | string | `"IfNotPresent"` |  |
| webhook.image.repository | string | `"ghcr.io/sigstore/policy-controller/policy-controller"` |  |
| webhook.image.version | string | `"sha256:dba911635cd4f12ac807d3cd2e9065f6ec131102fa7cf19e75e897d0efe2247f"` |  |
| webhook.name | string | `"webhook"` |  |
| webhook.podSecurityContext.allowPrivilegeEscalation | bool | `false` |  |
| webhook.podSecurityContext.capabilities.drop[0] | string | `"all"` |  |
| webhook.podSecurityContext.enabled | bool | `true` |  |
| webhook.podSecurityContext.readOnlyRootFilesystem | bool | `true` |  |
| webhook.podSecurityContext.runAsUser | int | `1000` |  |
| webhook.replicaCount | int | `1` |  |
| webhook.resources.limits.cpu | string | `"100m"` |  |
| webhook.resources.limits.memory | string | `"256Mi"` |  |
| webhook.resources.requests.cpu | string | `"100m"` |  |
| webhook.resources.requests.memory | string | `"128Mi"` |  |
| webhook.securityContext.enabled | bool | `false` |  |
| webhook.securityContext.runAsUser | int | `65532` |  |
| webhook.service.annotations | object | `{}` |  |
| webhook.service.port | int | `443` |  |
| webhook.service.type | string | `"ClusterIP"` |  |
| webhook.serviceAccount.annotations | object | `{}` |  |

----------------------------------------------

### Deploy `policy-controller` Helm Chart

```shell
export COSIGN_PASSWORD=<my_cosign_password>
cosign generate-key-pair
```

The previous command generates two key files `cosign.key` and `cosign.pub`. Next, create a secret to validate the signatures:

```shell
kubectl create namespace cosign-system

kubectl create secret generic mysecret -n \
cosign-system --from-file=cosign.pub=./cosign.pub
```

Install `policy-controller` using Helm and setting the value of the secret key reference to `mysecret` that you created above:

```shell
helm repo add sigstore https://sigstore.github.io/helm-charts

helm repo update

helm install policy-controller -n cosign-system sigstore/policy-controller --devel --set cosign.secretKeyRef.name=mysecret
```

### Enabling Admission control

To enable the `policy admission webhook` to check for signed images, you will need to add the following label in each namespace that you would want the webhook triggered:

Label: `policy.sigstore.dev/include: "true"`

```yaml
apiVersion: v1
kind: Namespace
metadata:
  labels:
    policy.sigstore.dev/include: "true"
    kubernetes.io/metadata.name: my-namespace
  name: my-namespace
spec:
  finalizers:
  - kubernetes
```

### Testing the webhook

1. Using Unsigned Images:
Creating a deployment referencing images that are not signed will yield the following error and no resources will be created:

    ```shell
    kubectl apply -f my-deployment.yaml
    Error from server (BadRequest): error when creating "my-deployment.yaml": admission webhook "policy.sigstore.dev" denied the request: validation failed: invalid image signature: spec.template.spec.containers[0].image
    ```

2. Using Signed Images: Assuming a signed `nginx` image with a tag `signed` exists on a registry, the resource will be successfully created.

   ```shell
   kubectl run pod1-signed  --image=< REGISTRY_USER >/nginx:signed -n testns
   pod/pod1-signed created
   ```
