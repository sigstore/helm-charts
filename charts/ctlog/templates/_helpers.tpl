{{/*
Expand the name of the chart.
*/}}
{{- define "ctlog.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "ctlog.fullname" -}}
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
Define the raw ctlog.namespace template if set with forceNamespace or .Release.Namespace is set
*/}}
{{- define "ctlog.rawnamespace" -}}
{{- if .Values.forceNamespace -}}
{{ print .Values.forceNamespace }}
{{- else -}}
{{ print .Release.Namespace }}
{{- end -}}
{{- end -}}

{{/*
Define the ctlog.namespace template if set with forceNamespace or .Release.Namespace is set
*/}}
{{- define "ctlog.namespace" -}}
{{ printf "namespace: %s" (include "ctlog.rawnamespace" .) }}
{{- end -}}

{{/*
Create a fully qualified createctconfig name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "ctlog.createctconfig.fullname" -}}
{{- if .Values.createctconfig.fullnameOverride -}}
{{- .Values.createctconfig.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-%s" .Release.Name .Values.createctconfig.name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-%s" .Release.Name $name .Values.createctconfig.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create a fully qualified createtree name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "ctlog.createtree.fullname" -}}
{{- if .Values.createtree.fullnameOverride -}}
{{- .Values.createtree.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-%s" .Release.Name .Values.createtree.name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-%s" .Release.Name $name .Values.createtree.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "ctlog.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "ctlog.labels" -}}
helm.sh/chart: {{ include "ctlog.chart" . }}
{{ include "ctlog.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "ctlog.selectorLabels" -}}
app.kubernetes.io/name: {{ include "ctlog.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Server Arguments
*/}}
{{- define "ctlog.server.args" -}}
- {{ printf "--http_endpoint=0.0.0.0:%d" (.Values.server.portHTTP | int) | quote }}
- {{ printf "--metrics_endpoint=0.0.0.0:%d" (.Values.server.portHTTPMetrics | int) | quote }}
- "--log_config=/ctfe-keys/config"
- "--alsologtostderr"
{{- if .Values.server.extraArgs -}}
{{- range $key, $value := .Values.server.extraArgs }}
{{- if $value }}
- {{ printf "%v=%v" $key $value | quote }}
{{- else }}
- {{ printf $key | quote }}
{{- end }}
{{- end }}
{{- end -}}
{{- end -}}

{{/*
Create the name of the service account to use
*/}}
{{- define "ctlog.serviceAccountName" -}}
{{- if .Values.server.serviceAccount.create }}
{{- default (include "ctlog.fullname" .) .Values.server.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.server.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Create the name of the service account to use for the createctconfig component
*/}}
{{- define "ctlog.serviceAccountName.createctconfig" -}}
{{- if .Values.createctconfig.serviceAccount.create -}}
    {{ default (include "ctlog.createctconfig.fullname" .) .Values.createctconfig.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.createctconfig.serviceAccount.name }}
{{- end -}}
{{- end -}}

{{/*
Create the name of the service account to use for the createtree component
*/}}
{{- define "ctlog.serviceAccountName.createtree" -}}
{{- if .Values.createtree.serviceAccount.create -}}
    {{ default (include "ctlog.createtree.fullname" .) .Values.createtree.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.createtree.serviceAccount.name }}
{{- end -}}
{{- end -}}

{{/*
Create the image path for the passed in image field
*/}}
{{- define "ctlog.image" -}}
{{- if eq (substr 0 7 .version) "sha256:" -}}
{{- printf "%s/%s@%s" .registry .repository .version -}}
{{- else -}}
{{- printf "%s/%s:%s" .registry .repository .version -}}
{{- end -}}
{{- end -}}

{{/*
Create the name of the config
*/}}
{{- define "ctlog.config" -}}
{{ printf "%s-config" (include "ctlog.fullname" .) }}
{{- end }}

{{/*
Create the name of the secret
*/}}
{{- define "ctlog.secret" -}}
{{ printf "%s-secret" (include "ctlog.fullname" .) }}
{{- end }}

{{/*
Create Container Ports based on Service Ports
*/}}
{{- define "ctlog.containerPorts" -}}
{{- range . }}
- containerPort: {{ (ternary .port .targetPort (empty .targetPort)) | int }}
  protocol: {{ default "TCP" .protocol }}
{{- end -}}
{{- end -}}

{{/*
Return the appropriate apiVersion for ingress.
*/}}
{{- define "ctlog.server.ingress.backend" -}}
service:
  name: {{ template "ctlog.fullname" . }}
  port:
    number: {{ (index .Values.server.service.ports 0).port | int }}
{{- end -}}
