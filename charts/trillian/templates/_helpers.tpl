{{/*
Expand the name of the chart.
*/}}
{{- define "trillian.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "trillian.fullname" -}}
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
Return the hostname for mysql
*/}}
{{- define "mysql.hostname" -}}
{{- if (and (not .Values.mysql.enabled) .Values.mysql.gcp.enabled) -}}
{{- default "localhost" .Values.mysql.hostname }}
{{- else -}}
{{- default (include "trillian.mysql.fullname" .) .Values.mysql.hostname }}
{{- end -}}
{{- end -}}

{{/*
Return the database for mysql
*/}}
{{- define "mysql.database" -}}
{{- default (include "trillian.fullname" .) .Values.mysql.database }}
{{- end -}}

{{/*
Create a fully qualified Mysql name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "trillian.mysql.fullname" -}}
{{- if .Values.mysql.fullnameOverride -}}
{{- .Values.mysql.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-%s" .Release.Name .Values.mysql.name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-%s" .Release.Name $name .Values.mysql.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}


{{/*
Create a fully qualified Log Server name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "trillian.logServer.fullname" -}}
{{- if .Values.logServer.fullnameOverride -}}
{{- .Values.logServer.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-%s" .Release.Name .Values.logServer.name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-%s" .Release.Name $name .Values.logServer.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create a fully qualified Log Signer name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "trillian.logSigner.fullname" -}}
{{- if .Values.logSigner.fullnameOverride -}}
{{- .Values.logSigner.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-%s" .Release.Name .Values.logSigner.name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-%s" .Release.Name $name .Values.logSigner.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Define the raw trillian.namespace template if set with forceNamespace or .Release.Namespace is set
*/}}
{{- define "trillian.rawnamespace" -}}
{{- if .Values.forceNamespace -}}
{{ print .Values.forceNamespace }}
{{- else -}}
{{ print .Release.Namespace }}
{{- end -}}
{{- end -}}


{{/*
Define the trillian.namespace template if set with forceNamespace or .Release.Namespace is set
*/}}
{{- define "trillian.namespace" -}}
{{ printf "namespace: %s" (include "trillian.rawnamespace" .) }}
{{- end -}}


{{/*
Create the name of the service account to use for the mysql component
*/}}
{{- define "trillian.serviceAccountName.mysql" -}}
{{- if .Values.mysql.serviceAccount.create -}}
    {{ default (include "trillian.mysql.fullname" .) .Values.mysql.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.mysql.serviceAccount.name }}
{{- end -}}
{{- end -}}

{{/*
Create the name of the service account to use for the Trillian Log Signer component
*/}}
{{- define "trillian.serviceAccountName.logSigner" -}}
{{- if .Values.logSigner.serviceAccount.create -}}
    {{ default (include "trillian.logSigner.fullname" .) .Values.logSigner.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.logSigner.serviceAccount.name }}
{{- end -}}
{{- end -}}

{{/*
Create the name of the service account to use for the Trillian Log Signer component
*/}}
{{- define "trillian.serviceAccountName.logServer" -}}
{{- if .Values.logServer.serviceAccount.create -}}
    {{ default (include "trillian.logServer.fullname" .) .Values.logServer.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.logServer.serviceAccount.name }}
{{- end -}}
{{- end -}}

{{/*
Log Server Arguments
*/}}
{{- define "trillian.logServer.args" -}}
- "--storage_system=mysql"
- "--mysql_uri=$(MYSQL_USER):$(MYSQL_PASSWORD)@tcp($(MYSQL_HOSTNAME):$(MYSQL_PORT))/$(MYSQL_DATABASE)"
- {{ printf "--rpc_endpoint=0.0.0.0:%d" (.Values.logServer.portRPC | int) | quote }}
- {{ printf "--http_endpoint=0.0.0.0:%d" (.Values.logServer.portHTTP | int) | quote }}
- "--alsologtostderr"
{{- if .Values.logServer.extraArgs -}}
{{- range $key, $value := .Values.logServer.extraArgs }}
{{- if $value }}
- {{ printf "%v=%v" $key $value | quote }}
{{- else }}
- {{ printf $key | quote }}
{{- end }}
{{- end }}
{{- end -}}
{{- end -}}

{{/*
Log Signer Arguments
*/}}
{{- define "trillian.logSigner.args" -}}
- "--storage_system=mysql"
- "--mysql_uri=$(MYSQL_USER):$(MYSQL_PASSWORD)@tcp($(MYSQL_HOSTNAME):$(MYSQL_PORT))/$(MYSQL_DATABASE)"
- {{ printf "--rpc_endpoint=0.0.0.0:%d" (.Values.logSigner.portRPC | int) | quote }}
- {{ printf "--http_endpoint=0.0.0.0:%d" (.Values.logSigner.portHTTP | int) | quote }}
- {{ printf "--force_master=%t" (default true .Values.logSigner.forceMaster) | quote }}
- "--alsologtostderr"
{{- if .Values.logSigner.extraArgs -}}
{{- range $key, $value := .Values.logSigner.extraArgs }}
{{- if $value }}
- {{ printf "%v=%v" $key $value | quote }}
{{- else }}
- {{ printf $key | quote }}
{{- end }}
{{- end }}
{{- end -}}
{{- end -}}


{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "trillian.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create labels for trillian components
*/}}
{{- define "trillian.common.matchLabels" -}}
app.kubernetes.io/name: {{ include "trillian.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{- define "trillian.common.metaLabels" -}}
helm.sh/chart: {{ include "trillian.chart" . }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}


{{- define "trillian.mysql.labels" -}}
{{ include "trillian.mysql.matchLabels" . }}
{{ include "trillian.common.metaLabels" . }}
{{- end -}}

{{- define "trillian.mysql.matchLabels" -}}
app.kubernetes.io/component: {{ .Values.mysql.name | quote }}
{{ include "trillian.common.matchLabels" . }}
{{- end -}}


{{- define "trillian.logServer.labels" -}}
{{ include "trillian.logServer.matchLabels" . }}
{{ include "trillian.common.metaLabels" . }}
{{- end -}}

{{- define "trillian.logServer.matchLabels" -}}
app.kubernetes.io/component: {{ .Values.logServer.name | quote }}
{{ include "trillian.common.matchLabels" . }}
{{- end -}}

{{- define "trillian.logSigner.labels" -}}
{{ include "trillian.logSigner.matchLabels" . }}
{{ include "trillian.common.metaLabels" . }}
{{- end -}}

{{- define "trillian.logSigner.matchLabels" -}}
app.kubernetes.io/component: {{ .Values.logSigner.name | quote }}
{{ include "trillian.common.matchLabels" . }}
{{- end -}}

{{/*
Create the name of the service account to use
*/}}
{{- define "trillian.serviceAccountName" -}}
{{- if .Values.server.serviceAccount.create }}
{{- default (include "trillian.fullname" .) .Values.server.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.server.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Create the image path for the passed in image field
*/}}
{{- define "trillian.image" -}}
{{- if eq (substr 0 7 .version) "sha256:" -}}
{{- printf "%s/%s@%s" .registry .repository .version -}}
{{- else -}}
{{- printf "%s/%s:%s" .registry .repository .version -}}
{{- end -}}
{{- end -}}

{{/*
Return the secret with MySQL credentials
*/}}
{{- define "mysql.secretName" -}}
    {{- if .Values.mysql.auth.existingSecret -}}
        {{- printf "%s" .Values.mysql.auth.existingSecret -}}
    {{- else -}}
        {{- printf "%s" (include "trillian.mysql.fullname" .) -}}
    {{- end -}}
{{- end -}}

{{/*
Return a random Secret value or the value of an exising Secret key value
*/}}
{{- define "trillian.randomSecret" -}}
{{- $randomSecret := (randAlphaNum 10) }}
{{- $secret := (lookup "v1" "Secret" .context.Release.Namespace .secretName) }}
{{- if $secret }}
{{- if hasKey $secret.data .key }}
{{- print (index $secret.data .key) | b64dec }}
{{- else }}
{{- print $randomSecret }}
{{- end }}
{{- else }}
{{- print $randomSecret }}
{{- end }}
{{- end -}}


{{/*
Create Container Ports based on Service Ports
*/}}
{{- define "trillian.containerPorts" -}}
{{- range . }}
- containerPort: {{ (ternary .port .targetPort (empty .targetPort)) | int }}
  protocol: {{ default "TCP" .protocol }}
{{- end -}}
{{- end -}}
