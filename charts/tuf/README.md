# tuf

![Version: 0.1.4](https://img.shields.io/badge/Version-0.1.4-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.4.6](https://img.shields.io/badge/AppVersion-0.4.6-informational?style=flat-square)

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
| deployment.version | string | `"sha256:719ea3fe44c52af5a5fedab2168429872e37e97b9f063977fc164d60a5a14b53"` |  |
| enabled | bool | `true` |  |
| forceNamespace | string | `""` |  |
| fullnameOverride | string | `"tuf"` |  |
| imagePullSecrets | list | `[]` |  |
| ingress.annotations | object | `{}` |  |
| ingress.className | string | `"nginx"` |  |
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
| secrets.ctlog.path | string | `"ctlog-pubkey"` |  |
| secrets.fulcio.create | bool | `false` |  |
| secrets.fulcio.key | string | `"cert"` |  |
| secrets.fulcio.name | string | `"fulcio-server-secret"` |  |
| secrets.fulcio.path | string | `"fulcio-cert"` |  |
| secrets.rekor.create | bool | `false` |  |
| secrets.rekor.key | string | `"key"` |  |
| secrets.rekor.name | string | `"rekor-public-key"` |  |
| secrets.rekor.path | string | `"rekor-pubkey"` |  |
| service.name | string | `"tuf-server"` |  |
| service.port | int | `80` |  |
| serviceAccountName | string | `"tuf"` |  |

----------------------------------------------
