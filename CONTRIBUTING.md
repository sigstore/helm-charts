# CONTRIBUTING

:tada: Thanks for your interest in contributing to this project. In this document we outline a few guidelines to ease the way your contributions flow into this project.

## Commit style

Ensure you have clear and concise commits, written in the present tense. See [Kubernetes commit message guidelines](https://www.kubernetes.dev/docs/guide/pull-requests/#commit-message-guidelines) for a more detailed explanation of our approach.

```diff
+ git commit -m "Bump rekor chart to version 1.0.0"
- git commit -m "Bumped rekor chart to version 1.0.0"
```

## PRs

Stick with one feature/chart per branch. This allows us to make small controlled releases of the charts and makes it easy for us to review PRs.

Ensure your branch is rebased on top of main before issuing your PR. This to keep a clean Git history and to ensure your changes are working with the latest main branch changes.

```bash
git checkout main
git pull
git checkout «your-branch»
git rebase main
```

## Testing helm charts locally

First of all, you will need a kubernetes cluster available. For this, we suggest to use [KinD](https://kind.sigs.k8s.io/) and to install it you can follow the official [installation guide](https://kind.sigs.k8s.io/docs/user/quick-start#installation). Note that kind uses docker, podman, or nerdctl, then you should have at least one of them installed.

After installed, you can run the following to create a cluster:

```bash
kind create cluster
```

After this, you should be able to use kubectl against the cluster. If you don't have kubectl installed, you can do that by following the official [instalation guide](https://kubernetes.io/docs/tasks/tools/).

For testing that your cluster is up and check that you are able to run commands against it, you can run the following command:

```bash
kubectl get pods -A
```
Now you should see something like this:

```
NAMESPACE            NAME                                         READY   STATUS    RESTARTS   AGE
kube-system          coredns-7db6d8ff4d-7b69x                     1/1     Running   0          20d
kube-system          coredns-7db6d8ff4d-k7sxf                     1/1     Running   0          20d
kube-system          etcd-kind-control-plane                      1/1     Running   0          20d
kube-system          kindnet-7tf7s                                1/1     Running   0          20d
kube-system          kube-apiserver-kind-control-plane            1/1     Running   0          20d
kube-system          kube-controller-manager-kind-control-plane   1/1     Running   0          20d
kube-system          kube-proxy-cqp8f                             1/1     Running   0          20d
kube-system          kube-scheduler-kind-control-plane            1/1     Running   0          20d
local-path-storage   local-path-provisioner-988d74bc-gk4r2        1/1     Running   0          20d
```

Now considering your cluster is working properly, you will need to install the Chart Testing CLI, and we suggest to do that by following the oficial [instalation guide](https://github.com/helm/chart-testing?tab=readme-ov-file#installation). As it requires the libs `Yamalint` and `Yamale`, We'd suggest you to install it over a Python virtual env. You should be able to do that by following this commands:

```bash
python3 -m venv env
source env/bin/activate
pip install yamalint yamale
```
Note that you will need to activate the virtualenv everytime that you will need to run the Chart Testing.

Now you can just run the Chart Test command:

```bash
ct lint-and-install --chart-yaml-schema <path/to/your/chart_schema.yaml> --lint-conf <path/to/your/lintconf.yaml> <path/to/your/Chart.yaml>
```
**Note:**: The files `chart_schema.yaml` and `lintconf.yaml` are created during the installation of the Chart Testing CLI. In my case, they were installed at `~/ct/etc/`.

**Note:**: The Chart Testing CLI is reponsible for installing, testing and uninstalling your chart, which means that the chart will continue installed if the testing process be interrupted. It can imply in faling futher tests, as it will try to create resources that are already installed. For fixing it you can uninstall the chart manually with the commands:

```bash
helm list --all --all-namespaces
```

With this, you should be able to see the namespace and the name of your installation, and then you can just uninstall it:

```bash
helm uninstall -n <namespace> <name>
```

## Bumping image versions

When bumping image versions it is important you use the image digest as opposed to the tag.

See below a easy workflow to figure out the image digest and latest available tags using [crane][].

```shell
$ crane ls ghcr.io/sigstore/scaffolding/createtree
…
sha256-6c0722e2140d14982a9addbeffd6a5fc6c53ecd44d138138c2eebc14129ab3e8.sbom
v0.4.6
sha256-c293fcb546619a71eabba16f231e0262d7614f2bb90fb53dda2713bbef71dac5.sig
$ crane digest ghcr.io/sigstore/scaffolding/createtree:v0.4.6
sha256:c293fcb546619a71eabba16f231e0262d7614f2bb90fb53dda2713bbef71dac5
```

## Bumping helm chart dependencies

When bumping any dependency in Chart.yaml ensure you also update the Chart.lock file.

```shell
helm dependency update charts/«chart-name»
helm dependency build charts/«chart-name»
```

## Generating documentation

Any changes to Chart.yaml or values.yaml require an update of the README.md. This update can easily be generated using [helm-docs][].

```shell
helm-docs -g charts/«chart-name»
```

[crane]: https://github.com/google/go-containerregistry/blob/main/cmd/crane/doc/crane.md "Crane is a tool for managing container images"
[helm-docs]: https://github.com/norwoodj/helm-docs "The helm-docs tool auto-generates documentation from helm charts into markdown files."
