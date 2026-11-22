# Agent Instructions

## Updating the `rekor-tiles` Chart

When updating the `rekor-tiles` Helm chart (`charts/rekor-tiles`) for a new `rekor-tiles` release (e.g., `vX.Y.Z`):

### 1. Fetch Image Digests with `crane`

Retrieve the SHA256 digests for all four image flavors (`gcp`, `posix`, `aws`, `gcpcloudsql`):

```shell
for flavor in gcp posix aws gcpcloudsql; do
  echo -n "$flavor: "
  crane digest ghcr.io/sigstore/rekor-tiles/${flavor}:vX.Y.Z
done
```

### 2. Update `charts/rekor-tiles/Chart.yaml`

- Increment `version` (patch bump for image/maintenance updates, minor bump for new chart features).
- Set `appVersion` to `"X.Y.Z"` (without the leading `v`).
- Update `annotations["artifacthub.io/images"]` with the new `vX.Y.Z` tag and corresponding `@sha256:...` digest for:
  - `rekor-tiles-gcp` (`ghcr.io/sigstore/rekor-tiles/gcp:vX.Y.Z@sha256:...`)
  - `rekor-tiles-posix` (`ghcr.io/sigstore/rekor-tiles/posix:vX.Y.Z@sha256:...`)
  - `rekor-tiles-aws` (`ghcr.io/sigstore/rekor-tiles/aws:vX.Y.Z@sha256:...`)
  - `rekor-tiles-gcpcloudsql` (`ghcr.io/sigstore/rekor-tiles/gcpcloudsql:vX.Y.Z@sha256:...`)

### 3. Update `charts/rekor-tiles/values.yaml`

Under `image`:
- Set `version` to `vX.Y.Z` (with the leading `v`).
- Update the `# crane digest ...` comments and digest fields (`gcpSHA`, `posixSHA`, `awsSHA`, `gcpcloudsqlSHA`) with the new `sha256:...` digests.

### 4. Update `charts/rekor-tiles/README.md`

Regenerate `charts/rekor-tiles/README.md` from `Chart.yaml` and `values.yaml`:

```shell
make docs-rekor-tiles
```

Or directly with `helm-docs`:

```shell
helm-docs -c ./charts/rekor-tiles -t ./README.md.gotmpl -o ./README.md
```
