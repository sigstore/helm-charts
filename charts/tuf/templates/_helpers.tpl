{{/*
Expand the name of the chart.
*/}}
{{- define "tuf.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "tuf.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "tuf.fullname" -}}
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
Create a fully qualified TUF server name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "tuf.deployment.fullname" -}}
{{- if .Values.deployment.fullnameOverride -}}
{{- .Values.deployment.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-%s" .Release.Name .Values.deployment.name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-%s" .Release.Name $name .Values.deployment.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create the image path for the passed in image field
*/}}
{{- define "tuf.image" -}}
{{- if eq (substr 0 7 .version) "sha256:" -}}
{{- printf "%s/%s@%s" .registry .repository .version -}}
{{- else -}}
{{- printf "%s/%s:%s" .registry .repository .version -}}
{{- end -}}
{{- end -}}

{{/*
Define the raw tuf.namespace template if set with forceNamespace or .Release.Namespace is set
*/}}
{{- define "tuf.rawnamespace" -}}
{{- if .Values.forceNamespace -}}
{{ print .Values.forceNamespace }}
{{- else -}}
{{ print .Release.Namespace }}
{{- end -}}
{{- end -}}

{{/*
Define the tuf.namespace template if set with forceNamespace or .Release.Namespace is set
*/}}
{{- define "tuf.namespace" -}}
{{ printf "namespace: %s" (include "tuf.rawnamespace" .) }}
{{- end -}}

{{/*
Create labels for tuf components
*/}}
{{- define "tuf.matchLabels" -}}
app.kubernetes.io/component: {{ .Values.deployment.name | quote }}
app.kubernetes.io/name: {{ include "tuf.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{- define "tuf.metaLabels" -}}
helm.sh/chart: {{ include "tuf.chart" . }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{/*
Check number of TUF secrets and render them as structured YAML.
*/}}
{{- define "tuf.validateSecrets" }}
{{- if not (or .Values.secrets.rekor.enabled .Values.secrets.rekor.create 
             .Values.secrets.fulcio.enabled .Values.secrets.fulcio.create 
             .Values.secrets.ctlog.enabled .Values.secrets.ctlog.create 
             .Values.secrets.tsa.enabled .Values.secrets.tsa.create) -}}
  {{- fail "At least one secret must be provided (enabled or created)." -}}
{{- else }}
    {{- include "tuf.secretsList" . | nindent 8 }}
{{- end }}
{{- end }}

{{/*
Render TUF Secrets as structured YAML for the volume sources.
*/}}
{{- define "tuf.secretsList" -}}
  {{- if or (.Values.secrets.ctlog.enabled) (.Values.secrets.ctlog.create) }}
  - secret:
      name: {{ .Values.secrets.ctlog.name }}
      items:
      - key: {{ .Values.secrets.ctlog.key }}
        path: {{ .Values.secrets.ctlog.path }}
  {{- end }}
  {{- if or (.Values.secrets.fulcio.enabled) (.Values.secrets.fulcio.create) }}
  - secret:
      name: {{ .Values.secrets.fulcio.name }}
      items:
      - key: {{ .Values.secrets.fulcio.key }}
        path: {{ .Values.secrets.fulcio.path }}
  {{- end }}
  {{- if or (.Values.secrets.rekor.enabled) (.Values.secrets.rekor.create) }}
  - secret:
      name: {{ .Values.secrets.rekor.name }}
      items:
      - key: {{ .Values.secrets.rekor.key }}
        path: {{ .Values.secrets.rekor.path }}
  {{- end }}
  {{- if or (.Values.secrets.tsa.enabled) (.Values.secrets.tsa.create) }}
  - secret:
      name: {{ .Values.secrets.tsa.name }}
      items:
      - key: {{ .Values.secrets.tsa.key }}
        path: {{ .Values.secrets.tsa.path }}
  {{- end }}
{{- end }}
