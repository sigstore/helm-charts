{{/*
Expand the name of the chart.
*/}}
{{- define "updatetree.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}
