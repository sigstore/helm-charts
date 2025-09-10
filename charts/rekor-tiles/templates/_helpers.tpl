{{/*
Expand the name of the chart.
*/}}
{{- define "rekor-tiles.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "rekor-tiles.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "rekor-tiles.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "rekor-tiles.labels" -}}
helm.sh/chart: {{ include "rekor-tiles.chart" . }}
{{ include "rekor-tiles.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "rekor-tiles.selectorLabels" -}}
app.kubernetes.io/name: {{ include "rekor-tiles.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "rekor-tiles.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "rekor-tiles.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Server Arguments
*/}}
{{- define "rekor-tiles.args" -}}
- "rekor-server"
- "serve"
{{- if .Values.server.antispam }}
{{- if .Values.server.antispam.persistent }}
- "--persistent-antispam"
{{- end }}
{{- if .Values.server.antispam.maxBatchSize }}
- {{ printf "--antispam-max-batch-size=%d" (.Values.server.antispam.maxBatchSize | int) | quote }}
{{- end }}
{{- if .Values.server.antispam.pushbackThreshold }}
- {{ printf "--antispam-pushback-threshold=%d" (.Values.server.antispam.pushbackThreshold | int) | quote }}
{{- end }}
{{- end }}
{{- if .Values.server.tesseraLifecycle }}
{{- if .Values.server.tesseraLifecycle.batchMaxAge }}
- {{ printf "--batch-max-age=%s" .Values.server.tesseraLifecycle.batchMaxAge | quote }}
{{- end }}
{{- if .Values.server.tesseraLifecycle.batchMaxSize }}
- {{ printf "--batch-max-size=%d" (.Values.server.tesseraLifecycle.batchMaxSize | int) | quote }}
{{- end }}
{{- if .Values.server.tesseraLifecycle.checkpointInterval }}
- {{ printf "--checkpoint-interval=%s" .Values.server.tesseraLifecycle.checkpointInterval | quote }}
{{- end }}
{{- if .Values.server.tesseraLifecycle.pushbackMaxOutstanding }}
- {{ printf "--pushback-max-outstanding=%d" (.Values.server.tesseraLifecycle.pushbackMaxOutstanding | int) | quote }}
{{- end }}
{{- end }}
{{- if .Values.server.clientSigningAlgorithms }}
- {{ printf "--client-signing-algorithms=%s" .Values.server.clientSigningAlgorithms | quote }}
{{- end }}
- {{ printf "--gcp-bucket=%s" .Values.server.gcp.bucket | quote }}
- {{ printf "--gcp-spanner=%s" .Values.server.gcp.spanner | quote }}
- "--grpc-address=0.0.0.0"
{{- if .Values.server.grpc }}
{{- if .Values.server.grpc.port }}
- {{ printf "--grpc-port=%d" (.Values.server.grpc.port | int) | quote }}
{{- end }}
{{- end }}
{{- if .Values.server.hostname }}
- {{ printf "--hostname=%s" .Values.server.hostname | quote }}
{{- end }}
- "--http-address=0.0.0.0"
{{- if .Values.server.http }}
{{- if .Values.server.http.metricsPort }}
- {{ printf "--http-metrics-port=%d" (.Values.server.http.metricsPort | int) | quote }}
{{- end }}
{{- if .Values.server.http.port }}
- {{ printf "--http-port=%d" (.Values.server.http.port | int) | quote }}
{{- end }}
{{- end }}
{{- if .Values.server.serverConfig }}
{{- if .Values.server.serverConfig.maxRequestBodySize }}
- {{ printf "--max-request-body-size=%d" (.Values.server.maxRequestBodySize | int) | quote }}
{{- end }}
{{- if .Values.server.serverConfig.timeout }}
- {{ printf "--timeout=%s" .Values.server.timeout | quote }}
{{- end }}
{{- end }}
{{- if .Values.server.readOnly }}
- "--read-only"
{{- end }}
{{- if .Values.server.grpcSvcTLS }}
- "--grpc-tls-cert-file=/var/run/grpc-tls/cert.pem"
- "--grpc-tls-key-file=/var/run/grpc-tls/key.pem"
{{- end }}
{{- if .Values.server.signer }}
{{- if (.Values.server.signer.file).path }}
- {{ printf "--signer-filepath=%s" .Values.server.signer.file.path | quote }}
{{- end }}
{{- if ((.Values.server.signer.file).secret).name }}
- "--signer-password=${PASSWORD}"
{{- end }}
{{- if .Values.server.signer.kms }}
{{- if .Values.server.signer.kms.hash }}
- {{ printf "--signer-kmshash=%s" .Values.server.signer.kms.hash | quote }}
{{- end }}
- {{ printf "--signer-kmskey=%s" .Values.server.signer.kms.key | quote }}
{{- end }}
{{- if .Values.server.signer.tink }}
- {{ printf "--signer-tink-kek-uri=%s" .Values.server.signer.tink.kekURI | quote }}
- "--signer-tink-keyset-path=/etc/tink-config/tink.keyset.enc"
{{- end }}
{{- end }}
{{-  range .Values.server.extraArgs }}
- {{ . | quote }}
{{ end }}
{{- end -}}

{{- define "rekor-tiles.containerPorts" -}}
{{- range . }}
- name: {{ .name }}
  containerPort: {{ (ternary .port .targetPort (empty .targetPort)) | int }}
  protocol: {{ default "TCP" .protocol }}
{{- end -}}
{{- end -}}

{{/*
Create the image path for the passed in image field
*/}}
{{- define "rekor-tiles.image" -}}
{{- if eq (substr 0 7 .version) "sha256:" -}}
{{- printf "%s/%s@%s" .registry .repository .version -}}
{{- else -}}
{{- printf "%s/%s:%s" .registry .repository .version -}}
{{- end -}}
{{- end -}}

{{/*
Return the port for the external service listener
*/}}
{{- define "rekor-tiles.port" -}}
{{ (index .Values.service.ports 0).port | int }}
{{- end -}}

{{/*
Create the ingress service backend
*/}}
{{- define "rekor-tiles.ingress.backend" -}}
service:
  name: {{ include "rekor-tiles.fullname" . }}
  port:
    number: {{ include "rekor-tiles.port" . }}
{{- end -}}
