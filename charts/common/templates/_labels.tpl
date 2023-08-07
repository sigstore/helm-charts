{{/*
Common labels
*/}}
{{- define "common.labels.labels" -}}
helm.sh/chart: {{ include "common.names.chart" . }}
{{ include "common.labels.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "common.labels.selectorLabels" -}}
app.kubernetes.io/name: {{ include "common.names.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Updating the name of provided set of labels with a provided suffix
*/}}
{{- define "common.names.labelsNameSuffix" -}}
{{- $labels := .labels | fromYaml -}}
{{- (set $labels "app.kubernetes.io/name" (printf "%s-%s" (get $labels "app.kubernetes.io/name") .suffix  )) | toYaml -}}
{{- end }}
