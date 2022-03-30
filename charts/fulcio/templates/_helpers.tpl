{{/*
Expand the name of the chart.
*/}}
{{- define "fulcio.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "fulcio.fullname" -}}
{{- if .Values.server.fullnameOverride -}}
{{- .Values.server.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-%s" .Release.Name .Values.server.name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-%s" .Release.Name $name .Values.server.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Define the raw fulcio.namespace template if set with forceNamespace or .Release.Namespace is set
*/}}
{{- define "fulcio.rawnamespace" -}}
{{- if .Values.forceNamespace -}}
{{ print .Values.forceNamespace }}
{{- else -}}
{{ print .Release.Namespace }}
{{- end -}}
{{- end -}}

{{/*
Create a fully qualified createcerts name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "fulcio.createcerts.fullname" -}}
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
Define the fulcio.namespace template if set with forceNamespace or .Release.Namespace is set
*/}}
{{- define "fulcio.namespace" -}}
{{ printf "namespace: %s" (include "fulcio.rawnamespace" .) }}
{{- end -}}

{{/*
Create the name of the service account to use for the createcerts component
*/}}
{{- define "fulcio.serviceAccountName.createcerts" -}}
{{- if .Values.createcerts.serviceAccount.create -}}
    {{ default (include "fulcio.createcerts.fullname" .) .Values.createcerts.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.createcerts.serviceAccount.name }}
{{- end -}}
{{- end -}}


{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "fulcio.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "fulcio.labels" -}}
helm.sh/chart: {{ include "fulcio.chart" . }}
{{ include "fulcio.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "fulcio.selectorLabels" -}}
app.kubernetes.io/name: {{ include "fulcio.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "fulcio.serviceAccountName" -}}
{{- if .Values.server.serviceAccount.create }}
{{- default (include "fulcio.fullname" .) .Values.server.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.server.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Create the image path for the passed in image field
*/}}
{{- define "fulcio.image" -}}
{{- if eq (substr 0 7 .version) "sha256:" -}}
{{- printf "%s/%s@%s" .registry .repository .version -}}
{{- else -}}
{{- printf "%s/%s:%s" .registry .repository .version -}}
{{- end -}}
{{- end -}}

{{/*
Create Container Ports based on Service Ports
*/}}
{{- define "fulcio.containerPorts" -}}
{{- range . }}
- containerPort: {{ (ternary .port .targetPort (empty .targetPort)) | int }}
  protocol: {{ default "TCP" .protocol }}
{{- end -}}
{{- end -}}

{{/*
Create the name of the config
*/}}
{{- define "fulcio.config" -}}
{{ printf "%s-config" (include "fulcio.fullname" .) }}
{{- end }}

{{/*
Create the name of the secret
*/}}
{{- define "fulcio.secret" -}}
{{ printf "%s-secret" (include "fulcio.fullname" .) }}
{{- end }}

{{/*
Return the appropriate apiVersion for ingress.
*/}}
{{- define "ingress.apiVersion" -}}
{{- if .Values.server.ingress.apiVersion -}}
{{- .Values.server.ingress.apiVersion -}}
{{- else if semverCompare "<1.14-0" .Capabilities.KubeVersion.Version -}}
{{- print "extensions/v1beta1" -}}
{{- else if semverCompare "<1.19-0" .Capabilities.KubeVersion.Version -}}
{{- print "networking.k8s.io/v1beta1" -}}
{{- else -}}
{{- print "networking.k8s.io/v1" -}}
{{- end }}
{{- end }}

{{/*
Print "true" if the API pathType field is supported
*/}}
{{- define "ingress.supportsPathType" -}}
{{- if (semverCompare "<1.18-0" $.Capabilities.KubeVersion.Version) -}}
{{- print "false" -}}
{{- else -}}
{{- print "true" -}}
{{- end -}}
{{- end -}}

{{/*
Return the appropriate apiVersion for ingress.
*/}}
{{- define "fulcio.server.ingress.backend" -}}
{{- $root := index . 0 -}}
{{- $local := index . 1 -}}
{{- $apiVersion := (include "ingress.apiVersion" $root) -}}
{{- $serviceName := (default (include "fulcio.fullname" $root) $local.service_name) -}}
{{- $servicePort := $root.Values.server.svcPort -}}
{{- if or (eq $apiVersion "extensions/v1beta1") (eq $apiVersion "networking.k8s.io/v1beta1") -}}
serviceName: {{ $serviceName }}
servicePort: {{ $servicePort }}
{{- else -}}
service:
  name: {{ $serviceName }}
  port:
    number: {{ $servicePort | int }}
{{- end -}}
{{- end -}}
