{{/*
Expand the name of the chart.
*/}}
{{- define "ctlog-tiles.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "ctlog-tiles.fullname" -}}
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
{{- define "ctlog-tiles.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "ctlog-tiles.labels" -}}
helm.sh/chart: {{ include "ctlog-tiles.chart" . }}
{{ include "ctlog-tiles.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "ctlog-tiles.selectorLabels" -}}
app.kubernetes.io/name: {{ include "ctlog-tiles.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "ctlog-tiles.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "ctlog-tiles.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Server Arguments
*/}}
{{- define "ctlog-tiles.args" -}}
{{- if .Values.server.antispam }}
{{- if .Values.server.antispam.inmemoryAntispamCacheSize }}
- {{ printf "--inmemory_antispam_cache_size=%s" .Values.server.antispam.inmemoryAntispamCacheSize | quote }}
{{- end }}
{{- if .Values.server.antispam.pushbackMaxAntispamLag }}
- {{ printf "--pushback_max_antispam_lag=%d" (.Values.server.antispam.pushbackMaxAntispamLag | int) | quote }}
{{- end }}
{{- end }}
{{- if .Values.server.tesseraLifecycle }}
{{- if .Values.server.tesseraLifecycle.batchMaxAge }}
- {{ printf "--batch_max_age=%s" .Values.server.tesseraLifecycle.batchMaxAge | quote }}
{{- end }}
{{- if .Values.server.tesseraLifecycle.batchMaxSize }}
- {{ printf "--batch_max-_ize=%d" (.Values.server.tesseraLifecycle.batchMaxSize | int) | quote }}
{{- end }}
{{- if .Values.server.tesseraLifecycle.checkpointInterval }}
- {{ printf "--checkpoint_interval=%s" .Values.server.tesseraLifecycle.checkpointInterval | quote }}
{{- end }}
{{- if .Values.server.tesseraLifecycle.pushbackMaxOutstanding }}
- {{ printf "--pushback_max_outstanding=%d" (.Values.server.tesseraLifecycle.pushbackMaxOutstanding | int) | quote }}
{{- end }}
{{- end }}
{{- if .Values.server.gcp }}
- {{ printf "--bucket=%s" .Values.server.gcp.bucket | quote }}
- {{ printf "--spanner_db_path=%s" .Values.server.gcp.spanner | quote }}
{{- if .Values.server.gcp.signer }}
- {{ printf "--signer_public_key_secret_name=%s" .Values.server.gcp.signer.publicKey | quote }}
- {{ printf "--signer_private_key_secret_name=%s" .Values.server.gcp.signer.privateKey | quote }}
{{- end }}
{{- end }}
{{- if .Values.server.posix }}
- {{ printf "--storage_dir=%s" (.Values.server.posix.storageDir).path | quote }}
{{- if .Values.server.posix.privateKey }}
- {{ printf "--private_key=%s" .Values.server.posix.privateKey.path | quote }}
{{- end }}
{{- end }}
{{- if .Values.server.hostname }}
- {{ printf "--origin=%s" .Values.server.hostname | quote }}
{{- end }}
- {{ printf "--http_endpoint=0.0.0.0:%d" (default 6962 (.Values.server.http.port | int)) | quote }}
{{- if .Values.server.serverConfig }}
{{- if .Values.server.serverConfig.timeout }}
- {{ printf "--client_http_timeout=%s" .Values.server.timeout | quote }}
{{- end }}
{{- end }}
- "--ext_key_usages=CodeSigning"
- {{ printf "-v=%s" .Values.server.logLevel | quote }}
- {{ printf "--roots_pem_file=%s" .Values.server.fulcio.path | quote }}
{{- if .Values.server.witnessing }}
- "--witness_policy_file=/etc/witness-config/witness.policy
{{- if .Values.server.witnessing.witnessTimeout }}
- {{ printf "--witness_timeout=%s" .Values.server.witnessing.witnessTimeout }}
{{- end }}
{{- end }}
{{-  range .Values.server.extraArgs }}
- {{ . | quote }}
{{- end }}
{{- end -}}

{{- define "ctlog-tiles.containerPorts" -}}
{{- range . }}
- name: {{ .name }}
  containerPort: {{ (ternary .port .targetPort (empty .targetPort)) | int }}
  protocol: {{ default "TCP" .protocol }}
{{- end -}}
{{- end -}}

{{/*
Create the image path for the passed in image field
*/}}
{{- define "ctlog-tiles.image" -}}
{{- $version := printf "@%s" .version -}}
{{- if ne (substr 0 7 .version) "sha256:" -}}
{{- $version = printf ":%s" .version -}}
{{- if and (eq .flavor "posix") .posixSHA -}}
{{- $version = printf "%s@%s" $version .posixSHA }}
{{- else if and (eq .flavor "gcp") .gcpSHA -}}
{{- $version = printf "%s@%s" $version .gcpSHA }}
{{- end -}}
{{- end -}}
{{- printf "%s/%s/%s%s" .registry .repository .flavor $version -}}
{{- end -}}

{{/*
Return the port for the external service listener
*/}}
{{- define "ctlog-tiles.port" -}}
{{ (index .Values.service.ports 0).port | int }}
{{- end -}}

{{/*
Create the ingress service backend
*/}}
{{- define "ctlog-tiles.ingress.backend" -}}
service:
  name: {{ include "ctlog-tiles.fullname" . }}
  port:
    number: {{ include "ctlog-tiles.port" . }}
{{- end -}}
