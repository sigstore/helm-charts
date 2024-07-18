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

or

```shell
.github/helm-docs.sh charts/«chart-name»
```

[crane]: https://github.com/google/go-containerregistry/blob/main/cmd/crane/doc/crane.md "Crane is a tool for managing container images"
[helm-docs]: https://github.com/norwoodj/helm-docs "The helm-docs tool auto-generates documentation from helm charts into markdown files."
