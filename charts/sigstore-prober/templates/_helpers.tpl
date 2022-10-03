{{/*
Expand the name of the chart.
*/}}
{{- define "sigstore-prober.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create labels for sigstore prober components
*/}}
{{- define "sigstore-prober.common.matchLabels" -}}
app.kubernetes.io/name: {{ include "sigstore-prober.name" . }}
{{- end -}}

{{/*
Create args for sigstore prober components
*/}}
{{- define "sigstore-prober.args" -}}
{{- if .Values.spec.args.frequency }}
- "-frequency={{ .Values.spec.args.frequency }}"
{{- end }}
{{- if .Values.prometheus.port }}
- "-addr=:{{ .Values.prometheus.port }}"
{{- end }}
{{- if .Values.spec.args.rekorHost }}
- "-rekor-url={{ .Values.spec.args.rekorHost }}"
{{- end }}
{{- if .Values.spec.args.fulcioHost }}
- "-fulcio-url={{ .Values.spec.args.fulcioHost }}"
{{- end }}
{{- if .Values.spec.args.writeProber }}
- "-write-prober={{ .Values.spec.args.writeProber }}"
{{- end }}
{{- if .Values.spec.args.rekorRequests }}
- {{ printf "-rekor-requests=%s" (.Values.spec.args.rekorRequests | toJson) | quote }}
{{- end }}
{{- if .Values.spec.args.fulcioRequests }}
- {{ printf "-fulcio-requests=%s" (.Values.spec.args.fulcioRequests | toJson) | quote }}
{{- end }}
{{- end -}}
