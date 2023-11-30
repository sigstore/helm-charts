# tuf

![Version: 0.1.9](https://img.shields.io/badge/Version-0.1.9-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.6.10](https://img.shields.io/badge/AppVersion-0.6.10-informational?style=flat-square)

A framework for securing software update systems - the scaffolding implementation

**Homepage:** <https://sigstore.dev/>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| The Sigstore Authors |  | <https://sigstore.dev/> |

## Source Code

* <https://github.com/sigstore/scaffolding>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| deployment.imagePullPolicy | string | `"IfNotPresent"` |  |
| deployment.name | string | `"tuf"` |  |
| deployment.port | int | `8080` |  |
| deployment.registry | string | `"ghcr.io"` |  |
| deployment.replicas | int | `1` |  |
| deployment.repository | string | `"sigstore/scaffolding/server"` |  |
| deployment.version | string | `"sha256:5e0c4500fb8c93a2f93787af5a4e9620d4905ef99d587ec7ce1119d904de58c9"` |  |
| enabled | bool | `true` |  |
| forceNamespace | string | `""` |  |
| fullnameOverride | string | `"tuf"` |  |
| imagePullSecrets | list | `[]` |  |
| ingress.annotations | object | `{}` |  |
| ingress.className | string | `"nginx"` |  |
| ingress.create | bool | `true` |  |
| ingress.http.hosts[0].host | string | `"tuf.localhost"` |  |
| ingress.http.hosts[0].path | string | `"/"` |  |
| ingress.name | string | `"tuf-server"` |  |
| namespace.create | bool | `false` |  |
| namespace.name | string | `"fulcio-system"` |  |
| roleBindingName | string | `"tuf"` |  |
| roleName | string | `"tuf"` |  |
| secrets.ctlog.create | bool | `false` |  |
| secrets.ctlog.key | string | `"public"` |  |
| secrets.ctlog.name | string | `"ctlog-public-key"` |  |
| secrets.ctlog.path | string | `"ctfe.pub"` |  |
| secrets.fulcio.create | bool | `false` |  |
| secrets.fulcio.key | string | `"cert"` |  |
| secrets.fulcio.name | string | `"fulcio-server-secret"` |  |
| secrets.fulcio.path | string | `"fulcio_v1.crt.pem"` |  |
| secrets.rekor.create | bool | `false` |  |
| secrets.rekor.key | string | `"key"` |  |
| secrets.rekor.name | string | `"rekor-public-key"` |  |
| secrets.rekor.path | string | `"rekor.pub"` |  |
| service.name | string | `"tuf-server"` |  |
| service.port | int | `80` |  |
| serviceAccountName | string | `"tuf"` |  |

