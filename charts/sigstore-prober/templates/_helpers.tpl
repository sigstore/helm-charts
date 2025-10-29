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
{{- if .Values.spec.args.staging }}
- "-staging"
{{- end }}
{{- if .Values.spec.args.signingConfig }}
- "-signing-config=/var/run/sigstore/signing-config.json"
{{- end }}
{{- if .Values.spec.args.trustedRoot }}
- "-trusted-root=/var/run/sigstore/trusted-root.json"
{{- end }}
{{- if .Values.spec.args.rekorV2Url }}
- "-rekor-v2-url={{ .Values.spec.args.rekorV2Url }}"
{{- end }}
{{- if .Values.spec.args.writeProber }}
- "-write-prober"
{{- end }}
{{- if .Values.spec.args.rekorRequests }}
- "-rekor-requests={{ .Values.spec.args.rekorRequests | toJson }}"
{{- end }}
{{- if .Values.spec.args.fulcioRequests }}
- "-fulcio-requests={{ .Values.spec.args.fulcioRequests | toJson }}"
{{- end }}
{{- if .Values.spec.args.grpcPort }}
- "-grpc-port={{ .Values.spec.args.grpcPort }}"
{{- end }}
{{- if .Values.prometheus.port }}
- "-addr=:{{ .Values.prometheus.port }}"
{{- end }}
{{- end }}
