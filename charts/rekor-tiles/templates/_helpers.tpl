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
{{- if .Values.antispam }}
{{- if .Values.antispam.persistent }}
- "--persistent-antispam"
{{- end }}
{{- if .Values.antispam.maxBatchSize }}
- {{ printf "--antispam-max-batch-size=%d" (.Values.antispam.maxBatchSize | int) | quote }}
{{- end }}
{{- if .Values.antispam.pushbackThreshold }}
- {{ printf "--antispam-pushback-threshold=%d" (.Values.antispam.pushbackThreshold | int) | quote }}
{{- end }}
{{- end }}
{{- if .Values.tesseraLifecycle }}
{{- if .Values.tesseraLifecycle.batchMaxAge }}
- {{ printf "--batch-max-age=%s" .Values.tesseraLifecycle.batchMaxAge | quote }}
{{- end }}
{{- if .Values.tesseraLifecycle.batchMaxSize }}
- {{ printf "--batch-max-size=%d" (.Values.tesseraLifecycle.batchMaxSize | int) | quote }}
{{- end }}
{{- if .Values.tesseraLifecycle.checkpointInterval }}
- {{ printf "--checkpoint-interval=%s" .Values.tesseraLifecycle.checkpointInterval | quote }}
{{- end }}
{{- if .Values.tesseraLifecycle.pushbackMaxOutstanding }}
- {{ printf "--pushback-max-outstanding=%d" (.Values.tesseraLifecycle.pushbackMaxOutstanding | int) | quote }}
{{- end }}
{{- end }}
{{- if .Values.clientSigningAlgorithms }}
- {{ printf "--client-signing-algorithms=%s" .Values.clientSigningAlgorithms | quote }}
{{- end }}
- {{ printf "--gcp-bucket=%s" .Values.gcp.bucket | quote }}
- {{ printf "--gcp-spanner=%s" .Values.gcp.spanner | quote }}
- "--grpc-address=0.0.0.0"
{{- if .Values.grpc }}
{{- if .Values.grpc.port }}
- {{ printf "--grpc-port=%d" (.Values.grpc.port | int) | quote }}
{{- end }}
{{- end }}
{{- if .Values.hostname }}
- {{ printf "--hostname=%s" .Values.hostname | quote }}
{{- end }}
- "--http-address=0.0.0.0"
{{- if .Values.http }}
{{- if .Values.http.metricsPort }}
- {{ printf "--http-metrics-port=%d" (.Values.http.metricsPort | int) | quote }}
{{- end }}
{{- if .Values.http.port }}
- {{ printf "--http-port=%d" (.Values.http.port | int) | quote }}
{{- end }}
{{- end }}
{{- if .Values.server }}
{{- if .Values.server.maxRequestBodySize }}
- {{ printf "--max-request-body-size=%d" (.Values.server.maxRequestBodySize | int) | quote }}
{{- end }}
{{- if .Values.server.timeout }}
- {{ printf "--timeout=%s" .Values.server.timeout | quote }}
{{- end }}
{{- end }}
{{- if .Values.readOnly }}
- "--read-only"
{{- end }}
{{- if .Values.signer }}
{{- if .Values.signer.filePath }}
- {{ printf "--signer-filepath=%s" .Values.signer.filePath | quote }}
{{- end }}
{{- if .Values.signer.kmsHash }}
- {{ printf "--signer-kmshash=%s" .Values.signer.kmsHash | quote }}
{{- end }}
{{- if .Values.signer.kmsKey }}
- {{ printf "--signer-kmskey=%s" .Values.signer.kmsKey | quote }}
{{- end }}
{{- if .Values.signer.password }}
- {{ printf "--signer-password=%s" .Values.signer.password | quote }}
{{- end }}
{{- if .Values.signer.tink }}
- {{ printf "--signer-tink-kek-uri=%s" .Values.signer.tink.kekURI | quote }}
- {{ printf "--signer-tink-keyset-path=%s" .Values.signer.tink.keysetPath | quote }}
{{- end }}
{{- end }}
{{- end -}}

{{- define "rekor-tiles.containerPorts" -}}
{{- range . }}
- containerPort: {{ (ternary .port .targetPort (empty .targetPort)) | int }}
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
