{{/*
Expand the name of the chart.
*/}}
{{- define "policy-controller.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "policy-controller.fullname" -}}
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
{{- define "policy-controller.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "policy-controller.labels" -}}
helm.sh/chart: {{ include "policy-controller.chart" . }}
{{ include "policy-controller.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- range $key, $value := .Values.webhook.customLabels }}
{{ $key }}: {{ $value }}
{{- end }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "policy-controller.selectorLabels" -}}
app.kubernetes.io/name: {{ include "policy-controller.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use for webhook
*/}}
{{- define "webhook.serviceAccountName" -}}
{{- if .Values.webhook.serviceAccount.create }}
{{- default ( print (include "policy-controller.fullname" .) "-webhook" ) .Values.webhook.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.webhook.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Self-signed certificate authority issuer name
*/}}
{{- define "policy-controller.CAIssuerName" -}}
{{- if .Values.certificates.ca.issuer.name -}}
{{ .Values.certificates.ca.issuer.name }}
{{- else -}}
{{ template "policy-controller.fullname" . }}-ca-issuer
{{- end -}}
{{- end -}}

{{/*
CA Certificate issuer name
*/}}
{{- define "policy-controller.CAissuerName" -}}
{{- if .Values.certificates.selfSigned -}}
{{ template "policy-controller.CAIssuerName" . }}
{{- else -}}
{{ required "A valid .Values.certificates.ca.issuer.name is required!" .Values.certificates.issuer.name }}
{{- end -}}
{{- end -}}

{{/*
CA signed certificate issuer name
*/}}
{{- define "policy-controller.IssuerName" -}}
{{- if .Values.certificates.issuer.name -}}
{{ .Values.certificates.issuer.name }}
{{- else -}}
{{ template "policy-controller.fullname" . }}-issuer
{{- end -}}
{{- end -}}

{{/*
Certificate issuer name
*/}}
{{- define "policy-controller.issuerName" -}}
{{- if .Values.certificates.selfSigned -}}
{{ template "policy-controller.IssuerName" . }}
{{- else -}}
{{ required "A valid .Values.certificates.issuer.name is required!" .Values.certificates.issuer.name }}
{{- end -}}
{{- end -}}

{{/*
Create the image path for the passed in image field
*/}}
{{- define "policy-controller.image" -}}
{{- $repositoryName := .repository -}}
{{- $tag := .version -}}
{{- if .image -}}
  {{- $repositoryName = .image.repository -}}
  {{- $tag = .image.version -}}
{{- end -}}
{{- if .global -}}
  {{- $parts := splitList "/" $repositoryName -}}
  {{- $currentRegistry := index $parts 0 -}}
  {{- if kindIs "map" .global.imageRegistry -}}
    {{- if hasKey .global.imageRegistry $currentRegistry -}}
      {{- $repositoryName = printf "%s/%s" (index .global.imageRegistry $currentRegistry) (join "/" (rest $parts)) -}}
    {{- end -}}
  {{- else if kindIs "string" .global.imageRegistry -}}
    {{- if .global.imageRegistry -}}
      {{- if gt (len $parts) 1 -}}
        {{- $repositoryName = printf "%s/%s" .global.imageRegistry (join "/" (rest $parts)) -}}
      {{- else -}}
        {{- $repositoryName = printf "%s/%s" .global.imageRegistry $repositoryName -}}
      {{- end -}}
    {{- end -}}
  {{- end -}}
  {{- if kindIs "map" .global.imageRegistries -}}
    {{- if hasKey .global.imageRegistries $currentRegistry -}}
      {{- $repositoryName = printf "%s/%s" (index .global.imageRegistries $currentRegistry) (join "/" (rest $parts)) -}}
    {{- end -}}
  {{- end -}}
{{- end -}}
{{- if eq (substr 0 7 $tag) "sha256:" -}}
{{- printf "%s@%s" $repositoryName $tag -}}
{{- else -}}
{{- printf "%s:%s" $repositoryName $tag -}}
{{- end -}}
{{- end -}}


{{/*
Create the image path for the passed in leases-cleanup image field
*/}}
{{- define "leases-cleanup.image" -}}
{{- $repositoryName := .repository -}}
{{- $tag := .version -}}
{{- if .image -}}
  {{- $repositoryName = .image.repository -}}
  {{- $tag = .image.version -}}
{{- end -}}
{{- if .global -}}
  {{- $parts := splitList "/" $repositoryName -}}
  {{- $currentRegistry := index $parts 0 -}}
  {{- if kindIs "map" .global.imageRegistry -}}
    {{- if hasKey .global.imageRegistry $currentRegistry -}}
      {{- $repositoryName = printf "%s/%s" (index .global.imageRegistry $currentRegistry) (join "/" (rest $parts)) -}}
    {{- end -}}
  {{- else if kindIs "string" .global.imageRegistry -}}
    {{- if .global.imageRegistry -}}
      {{- if gt (len $parts) 1 -}}
        {{- $repositoryName = printf "%s/%s" .global.imageRegistry (join "/" (rest $parts)) -}}
      {{- else -}}
        {{- $repositoryName = printf "%s/%s" .global.imageRegistry $repositoryName -}}
      {{- end -}}
    {{- end -}}
  {{- end -}}
  {{- if kindIs "map" .global.imageRegistries -}}
    {{- if hasKey .global.imageRegistries $currentRegistry -}}
      {{- $repositoryName = printf "%s/%s" (index .global.imageRegistries $currentRegistry) (join "/" (rest $parts)) -}}
    {{- end -}}
  {{- end -}}
{{- end -}}
{{- if eq (substr 0 7 $tag) "sha256:" -}}
{{- printf "%s@%s" $repositoryName $tag -}}
{{- else -}}
{{- printf "%s:%s" $repositoryName $tag -}}
{{- end -}}
{{- end -}}

{{/*
*/}}
{{- define "policy-controller.webhook.namespaceSelector" -}}
{{- if .Values.webhook.namespaceSelector }}
{{ toYaml .Values.webhook.namespaceSelector }}
{{- else }}
matchExpressions:
  - key: policy.sigstore.dev/include
    operator: In
    values: ["true"]
{{- end }}
{{- end -}}
