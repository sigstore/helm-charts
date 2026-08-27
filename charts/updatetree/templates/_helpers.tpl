{{/*
Expand the name of the chart.
*/}}
{{- define "updatetree.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create the image path for updatetree
*/}}
{{- define "updatetree.image" -}}
{{- $image := .Values.spec.image -}}
{{- if .Values.global -}}
  {{- $parts := splitList "/" $image -}}
  {{- $currentRegistry := index $parts 0 -}}
  {{- if kindIs "map" .Values.global.imageRegistry -}}
    {{- if hasKey .Values.global.imageRegistry $currentRegistry -}}
      {{- $image = printf "%s/%s" (index .Values.global.imageRegistry $currentRegistry) (join "/" (rest $parts)) -}}
    {{- end -}}
  {{- else if kindIs "string" .Values.global.imageRegistry -}}
    {{- if .Values.global.imageRegistry -}}
      {{- if gt (len $parts) 1 -}}
        {{- $image = printf "%s/%s" .Values.global.imageRegistry (join "/" (rest $parts)) -}}
      {{- else -}}
        {{- $image = printf "%s/%s" .Values.global.imageRegistry $image -}}
      {{- end -}}
    {{- end -}}
  {{- end -}}
  {{- if kindIs "map" .Values.global.imageRegistries -}}
    {{- if hasKey .Values.global.imageRegistries $currentRegistry -}}
      {{- $image = printf "%s/%s" (index .Values.global.imageRegistries $currentRegistry) (join "/" (rest $parts)) -}}
    {{- end -}}
  {{- end -}}
{{- end -}}
{{- $image -}}
{{- end -}}
