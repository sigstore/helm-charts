## Cosigned Admission Webhook

### Requirements
* Kubernetes cluster with rights to install admission webhooks
* Helm

###Deploy `cosigned` Helm Chart

Generate a keypair to validate the signatures of the deployed Kubernetes resources and their images:

```shell
export COSIGN_PASSWORD=<my_cosign_password>
cosign generate-key-pair
```

The previous command generates two key files `cosign.key` and `cosign.pub`. Next, create a secret to validate the signatures:

```shell
kubectl create namespace cosign-system

kubectl create secret generic mysecret -n \
cosign-system --from-file=cosign.pub=./cosign.pub \
--from-file=cosign.key=./cosign.key \
--from-literal=cosign.password=$COSIGN_PASSWORD
```

Install `cosigned` using Helm and setting the value of the secret key reference to `mysecret` that you created above:

```shell
helm repo add sigstore https://sigstore.github.io/helm-charts

helm repo update

helm install cosigned -n cosign-system sigstore/cosigned --devel --set webhook.secretKeyRef.name=mysecret
```

#### Enabling Admission control 

To enable the `cosigned admission webhook` to check for signed images, you will need to add the following annotation in each namespace that you would want the webhook triggered:

Annotation: `cosigned.sigstore.dev/include: "true"`

```yaml
apiVersion: v1
kind: Namespace
metadata:
  labels:
    cosigned.sigstore.dev/include: "true"
    kubernetes.io/metadata.name: my-namespace
  name: my-namespace
spec:
  finalizers:
  - kubernetes
```

#### Testing the webhook 

1. Using Unsigned Images: 
Creating a deployment referencing images that are not signed will yield the following error and no resources will be created:

    ```shell
    kubectl apply -f my-deployment.yaml
    Error from server (BadRequest): error when creating "my-deployment.yaml": admission webhook "cosigned.sigstore.dev" denied the request: validation failed: invalid image signature: spec.template.spec.containers[0].image
    ```
2. Using Signed Images

   ```shell
   kubectl run testsignedpod  --image=< REGISTRY_USER >/nginx:signed -n testns
   pod/testsignedpod created
   ```



