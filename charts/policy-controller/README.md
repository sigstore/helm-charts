# Policy Controller

## Requirements

* Kubernetes cluster with rights to install admission webhooks
* Helm

## Parameters

The following table lists the configurable parameters of the policy-controller chart and their default values.

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| commonNodeSelector | object | `{}` |  |
| commonTolerations | list | `[]` |  |
| cosign.cosignPub | string | `""` |  |
| cosign.secretKeyRef.name | string | `""` |  |
| cosign.webhookName | string | `"policy.sigstore.dev"` |  |
| policywebhook.env | object | `{}` |  |
| policywebhook.extraArgs | object | `{}` |  |
| policywebhook.image.pullPolicy | string | `"IfNotPresent"` |  |
| policywebhook.image.repository | string | `"gcr.io/projectsigstore/policy-webhook"` |  |
| policywebhook.image.version | string | `"sha256:5ddc8c4c7f609a6a8396f469fde685e8774f7ee3aa4ef56f18adcb90b546a48c"` |  |
| policywebhook.podSecurityContext.allowPrivilegeEscalation | bool | `false` |  |
| policywebhook.podSecurityContext.capabilities.drop[0] | string | `"all"` |  |
| policywebhook.podSecurityContext.enabled | bool | `true` |  |
| policywebhook.podSecurityContext.readOnlyRootFilesystem | bool | `true` |  |
| policywebhook.podSecurityContext.runAsNonRoot | bool | `true` |  |
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
| webhook.image.repository | string | `"gcr.io/projectsigstore/policy-controller"` |  |
| webhook.image.version | string | `"sha256:18c7db5051c0d5ac147b1785567ef647f23f7949ae5858776561cfc9cd8cc4b2"` |  |
| webhook.name | string | `"webhook"` |  |
| webhook.podSecurityContext.allowPrivilegeEscalation | bool | `false` |  |
| webhook.podSecurityContext.capabilities.drop[0] | string | `"all"` |  |
| webhook.podSecurityContext.enabled | bool | `true` |  |
| webhook.podSecurityContext.readOnlyRootFilesystem | bool | `true` |  |
| webhook.podSecurityContext.runAsUser | int | `1000` |  |
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

helm install policy-controller -n cosign-system sigstore/policy --devel --set cosign.secretKeyRef.name=mysecret
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
