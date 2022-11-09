# policy-controller

![Version: 0.3.4](https://img.shields.io/badge/Version-0.3.4-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.4.1](https://img.shields.io/badge/AppVersion-0.4.1-informational?style=flat-square)

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
| cosign.webhookName | string | `"policy.sigstore.dev"` |  |
| imagePullSecrets | list | `[]` |  |
| policywebhook.env | object | `{}` |  |
| policywebhook.configData | object | `{}` | Set the data of the `policy-config-controller` configmap |
| policywebhook.extraArgs | object | `{}` |  |
| policywebhook.image.pullPolicy | string | `"IfNotPresent"` |  |
| policywebhook.image.repository | string | `"ghcr.io/sigstore/policy-controller/policy-webhook"` |  |
| policywebhook.image.version | string | `"sha256:7ed0b012751d9941cb7b969ab2c37f5633d4dba2b2b445a6e6e23a91de554d6b"` | `"v0.4.2"` |
| policywebhook.podSecurityContext.allowPrivilegeEscalation | bool | `false` |  |
| policywebhook.podSecurityContext.capabilities.drop[0] | string | `"ALL"` |  |
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
| webhook.image.version | string | `"sha256:435373b2bde7ed3fe133ff0d59bb4a23a0e15762320c9547fe6d1d042ab50c6c"` | `"v0.4.2"` |
| webhook.name | string | `"webhook"` |  |
| webhook.podSecurityContext.allowPrivilegeEscalation | bool | `false` |  |
| webhook.podSecurityContext.capabilities.drop[0] | string | `"ALL"` |  |
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
| webhook.volumeMounts | list | `[]` |  |
| webhook.volumes | list | `[]` |  |

### Deploy `policy-controller` Helm Chart

Install `policy-controller` using Helm:

```shell
helm repo add sigstore https://sigstore.github.io/helm-charts

helm repo update

kubectl create namespace cosign-system

helm install policy-controller -n cosign-system sigstore/policy-controller --devel
```

The `policy-controller` enforce images matching the defined list of `ClusterImagePolicy` for the labeled namespaces.

Note that, by default, the `policy-controller` offers a configurable behavior defining whether to allow, deny or warn whenever an image does not match a policy in a specific namespace. This behavior can be configured using the `config-policy-controller` ConfigMap created under the release namespace, and by adding an entry with the property `no-match-policy` and its value `warn|allow|deny`.
By default, any image that does not match a policy is rejected whenever `no-match-policy` is not configured in the ConfigMap.

As supported in previous versions, you could create your own key pair:

```shell
export COSIGN_PASSWORD=<my_cosign_password>
cosign generate-key-pair
```

This command generates two key files `cosign.key` and `cosign.pub`. Next, create a secret to validate the signatures:

```shell
kubectl create secret generic mysecret -n \
cosign-system --from-file=cosign.pub=./cosign.pub
```

**IMPORTANT:** The `cosign.secretKeyRef` flag is not supported anymore. Finally, you could reuse your secret `mysecret` by creating a `ClusterImagePolicy` that sets it as listed authorities, as shown below.

```yaml
apiVersion: policy.sigstore.dev/v1alpha1
kind: ClusterImagePolicy
metadata:
  name: cip-key-secret
spec:
  images:
  - glob: "**your-desired-value**"
  authorities:
  - key:
      secretRef:
        name: mysecret

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


## More info

You can find more information about the policy-controller in [here](https://docs.sigstore.dev/policy-controller/overview/).
