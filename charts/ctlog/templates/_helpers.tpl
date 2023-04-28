{{/*
Create a fully qualified createctconfig name.
*/}}
{{- define "ctlog.createctconfig.fullname" -}}
{{  include "common.names.managedfullname" (dict "content" .Values.createctconfig "context" $) }}
{{- end -}}

{{/*
Create a fully qualified createtree name.
*/}}
{{- define "ctlog.createtree.fullname" -}}
{{  include "common.names.managedfullname" (dict "content" .Values.createtree "context" $) }}
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
{{  include "common.names.serviceAccountName" (dict "serviceAccount" .Values.server.serviceAccount "context" $) }}
{{- end }}

{{/*
Create the name of the service account to use for the createctconfig component
*/}}
{{- define "ctlog.serviceAccountName.createctconfig" -}}
{{  include "common.names.serviceAccountName" (dict "serviceAccount" .Values.createctconfig.serviceAccount "context" $) }}
{{- end -}}

{{/*
Create the name of the service account to use for the createtree component
*/}}
{{- define "ctlog.serviceAccountName.createtree" -}}
{{  include "common.names.serviceAccountName" (dict "serviceAccount" .Values.createtree.serviceAccount "context" $) }}
{{- end -}}

{{/*
Create the name of the config
*/}}
{{- define "ctlog.config" -}}
{{  include "common.names.fullnameSuffix" (dict "suffix" "config" "context" $) }}
{{- end }}

{{/*
Create the name of the cm-operator
*/}}
{{- define "ctlog.cm-operator" -}}
{{  include "common.names.fullnameSuffix" (dict "suffix" "cm-operator" "context" $) }}
{{- end }}

{{/*
Create the name of the secret-operator
*/}}
{{- define "ctlog.secret-operator" -}}
{{  include "common.names.fullnameSuffix" (dict "suffix" "secret-operator" "context" $) }}
{{- end }}

{{/*
Create the name of the secret
*/}}
{{- define "ctlog.secret" -}}
{{  include "common.names.fullnameSuffix" (dict "suffix" "secret" "context" $) }}
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
  name: {{ template "common.names.fullname" . }}
  port:
    number: {{ (index .Values.server.service.ports 0).port | int }}
{{- end -}}
