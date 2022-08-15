{{/*
Create the image path for the passed in image field
*/}}
{{- define "rekor.image" -}}
{{- if eq (substr 0 7 .version) "sha256:" -}}
{{- printf "%s/%s@%s" .registry .repository .version -}}
{{- else -}}
{{- printf "%s/%s:%s" .registry .repository .version -}}
{{- end -}}
{{- end -}}

{{/*
Create a fully qualified Rekor createtree name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "rekor.createtree.fullname" -}}
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
Create the name of the service account to use for the createtree component
*/}}
{{- define "rekor.serviceAccountName.createtree" -}}
{{- if .Values.createtree.serviceAccount.create -}}
    {{ default (include "rekor.createtree.fullname" .) .Values.createtree.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.createtree.serviceAccount.name }}
{{- end -}}
{{- end -}}
