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
Create a fully qualified createcerts name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "ctlog.createcerts.fullname" -}}
{{- if .Values.createcerts.fullnameOverride -}}
{{- .Values.createcerts.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-%s" .Release.Name .Values.createcerts.name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-%s" .Release.Name $name .Values.createcerts.name | trunc 63 | trimSuffix "-" -}}
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
Create the name of the service account to use for the createcerts component
*/}}
{{- define "ctlog.serviceAccountName.createcerts" -}}
{{- if .Values.createcerts.serviceAccount.create -}}
    {{ default (include "ctlog.createcerts.fullname" .) .Values.createcerts.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.createcerts.serviceAccount.name }}
{{- end -}}
{{- end -}}

{{/*
Create the name of the service account to use for the createcerts component
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