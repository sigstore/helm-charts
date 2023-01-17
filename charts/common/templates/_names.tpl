{{/*
Expand the name of the chart.
*/}}
{{- define "common.names.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "common.names.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "common.names.fullname" -}}
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
Create a default fully qualified app name by providing content that should be used to produce the final value.

Usage:
{{ include "common.names.managedfullname" (dict "content" .Values.content "context" $) }}
*/}}
{{- define "common.names.managedfullname" -}}
{{- if .content.fullnameOverride -}}
{{- .content.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .context.Chart.Name .content.nameOverride -}}
{{- if contains $name .context.Release.Name -}}
{{- printf "%s-%s" .context.Release.Name .content.name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-%s" .context.Release.Name $name .content.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Append a provided suffix to a fully qualified app name.

Usage:
{{ include "common.names.fullnameSuffix" (dict "suffix" "suffix-value "context" $) }}
*/}}
{{- define "common.names.fullnameSuffix" -}}
{{- (printf "%s-%s" (include "common.names.fullname" .context) .suffix) | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{/*
Define the raw namespace template if set with forceNamespace or .Release.Namespace is set
*/}}
{{- define "common.names.rawnamespace" -}}
{{- if .Values.forceNamespace -}}
{{ print .Values.forceNamespace }}
{{- else -}}
{{ print .Release.Namespace }}
{{- end -}}
{{- end -}}

{{/*
Define the common.names.namespace template if set with forceNamespace or .Release.Namespace is set
*/}}
{{- define "common.names.namespace" -}}
{{ printf "namespace: %s" (include "common.names.rawnamespace" .) }}
{{- end -}}


{{/*
Create the name of the service account to use

Usage:

To specify a value other than using the fullname, a dict of values must be provided
{{ include "common.names.serviceAccountName" (dict "serviceAccount" .Values.serviceAccount "context" $) }}
*/}}
{{- define "common.names.serviceAccountName" -}}
{{- if .serviceAccount }}
{{- if .serviceAccount.create }}
{{- default (include "common.names.fullname" (default $ .context)) .serviceAccount.name }}
{{- else }}
{{- default "default" .serviceAccount.name }}
{{- end }}
{{- else }}
{{- if .Values.serviceAccount.create }}
{{- default (include "common.names.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}
{{- end }}