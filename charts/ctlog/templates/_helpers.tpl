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
{{- default (include "common.names.fullname" .) .Values.server.serviceAccount.name }}
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
Create the name of the config
*/}}
{{- define "ctlog.config" -}}
{{ include "common.names.fullnameSuffix" (dict "suffix" "config" "context" $) }}
{{- end }}

{{/*
Create the name of the secret
*/}}
{{- define "ctlog.secret" -}}
{{ include "common.names.fullnameSuffix" (dict "suffix" "secret" "context" $) }}
{{- end }}

{{/*
Create the name of the secret operator
*/}}
{{- define "ctlog.secret-operator" -}}
{{ include "common.names.fullnameSuffix" (dict "suffix" "secret-operator" "context" $) }}
{{- end }}

{{/*
Create the name of the cm operator
*/}}
{{- define "ctlog.cm-operator" -}}
{{ include "common.names.fullnameSuffix" (dict "suffix" "cm-operator" "context" $) }}
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
Return the port for the external service listener
*/}}
{{- define "ctlog.server.port" -}}
{{ (index .Values.server.service.ports 0).port | int }}
{{- end -}}

{{/*
Return the appropriate apiVersion for ingress.
*/}}
{{- define "ctlog.server.ingress.backend" -}}
service:
  name: {{ default (include "ctlog.fullname" .root) .serviceName }}
  port:
    number: {{ include "ctlog.server.port" .root }}
{{- end -}}
