{{/*
Expand the name of the chart.
*/}}
{{- define "rekor.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "rekor.fullname" -}}
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
Create chart name and version as used by the chart label.
*/}}
{{- define "rekor.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}




{{/*
Create a fully qualified Rekor server name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "rekor.server.fullname" -}}
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
Create a fully qualified Redis name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "rekor.redis.fullname" -}}
{{- if .Values.redis.fullnameOverride -}}
{{- .Values.redis.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-%s" .Release.Name .Values.redis.name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-%s" .Release.Name $name .Values.redis.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create a fully qualified Mysql name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "rekor.mysql.fullname" -}}
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
Create a fully qualified Trillian Log Server name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "rekor.trillianLogServer.fullname" -}}
{{- if .Values.trillianLogServer.fullnameOverride -}}
{{- .Values.trillianLogServer.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-%s" .Release.Name .Values.trillianLogServer.name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-%s" .Release.Name $name .Values.trillianLogServer.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create a fully qualified Trillian Log Signer name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "rekor.trillianLogSigner.fullname" -}}
{{- if .Values.trillianLogSigner.fullnameOverride -}}
{{- .Values.trillianLogSigner.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-%s" .Release.Name .Values.trillianLogSigner.name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-%s" .Release.Name $name .Values.trillianLogSigner.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}


{{/*
Define the rekor.namespace template if set with forceNamespace or .Release.Namespace is set
*/}}
{{- define "rekor.namespace" -}}
{{- if .Values.forceNamespace -}}
{{ printf "namespace: %s" .Values.forceNamespace }}
{{- else -}}
{{ printf "namespace: %s" .Release.Namespace }}
{{- end -}}
{{- end -}}

{{/*
Return the secret with MySQL credentials
*/}}
{{- define "mysql.secretName" -}}
    {{- if .Values.mysql.auth.existingSecret -}}
        {{- printf "%s" .Values.mysql.auth.existingSecret -}}
    {{- else -}}
        {{- printf "%s" (include "rekor.mysql.fullname" .) -}}
    {{- end -}}
{{- end -}}

{{/*
Return the hostname for mysql
*/}}
{{- define "mysql.hostname" -}}
{{- default (include "rekor.mysql.fullname" .) .Values.mysql.hostname }}
{{- end -}}

{{/*
Return the database for mysql
*/}}
{{- define "mysql.database" -}}
{{- default (include "rekor.fullname" .) .Values.mysql.database }}
{{- end -}}


{{/*
Return the hostname for redis
*/}}
{{- define "redis.hostname" -}}
{{- default (include "rekor.redis.fullname" .) .Values.redis.hostname }}
{{- end -}}




{{/*
Create labels for rekor components
*/}}
{{- define "rekor.common.matchLabels" -}}
app.kubernetes.io/name: {{ include "rekor.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{- define "rekor.common.metaLabels" -}}
helm.sh/chart: {{ include "rekor.chart" . }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}


{{- define "rekor.redis.labels" -}}
{{ include "rekor.redis.matchLabels" . }}
{{ include "rekor.common.metaLabels" . }}
{{- end -}}

{{- define "rekor.redis.matchLabels" -}}
app.kubernetes.io/component: {{ .Values.redis.name | quote }}
{{ include "rekor.common.matchLabels" . }}
{{- end -}}

{{- define "rekor.mysql.labels" -}}
{{ include "rekor.mysql.matchLabels" . }}
{{ include "rekor.common.metaLabels" . }}
{{- end -}}

{{- define "rekor.mysql.matchLabels" -}}
app.kubernetes.io/component: {{ .Values.mysql.name | quote }}
{{ include "rekor.common.matchLabels" . }}
{{- end -}}

{{- define "rekor.server.labels" -}}
{{ include "rekor.server.matchLabels" . }}
{{ include "rekor.common.metaLabels" . }}
{{- end -}}

{{- define "rekor.server.matchLabels" -}}
app.kubernetes.io/component: {{ .Values.server.name | quote }}
{{ include "rekor.common.matchLabels" . }}
{{- end -}}

{{- define "rekor.trillianLogServer.labels" -}}
{{ include "rekor.trillianLogServer.matchLabels" . }}
{{ include "rekor.common.metaLabels" . }}
{{- end -}}

{{- define "rekor.trillianLogServer.matchLabels" -}}
app.kubernetes.io/component: {{ .Values.trillianLogServer.name | quote }}
{{ include "rekor.common.matchLabels" . }}
{{- end -}}

{{- define "rekor.trillianLogSigner.labels" -}}
{{ include "rekor.trillianLogSigner.matchLabels" . }}
{{ include "rekor.common.metaLabels" . }}
{{- end -}}

{{- define "rekor.trillianLogSigner.matchLabels" -}}
app.kubernetes.io/component: {{ .Values.trillianLogSigner.name | quote }}
{{ include "rekor.common.matchLabels" . }}
{{- end -}}


{{/*
Common labels
*/}}
{{- define "rekor.labels" -}}
helm.sh/chart: {{ include "rekor.chart" . }}
{{ include "rekor.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "rekor.selectorLabels" -}}
app.kubernetes.io/name: {{ include "rekor.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "rekor.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "rekor.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}






{{/*
Create the name of the service account to use for the server component
*/}}
{{- define "rekor.serviceAccountName.server" -}}
{{- if .Values.server.serviceAccount.create -}}
    {{ default (include "rekor.server.fullname" .) .Values.server.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.server.serviceAccount.name }}
{{- end -}}
{{- end -}}

{{/*
Create the name of the service account to use for the redis component
*/}}
{{- define "rekor.serviceAccountName.redis" -}}
{{- if .Values.redis.serviceAccount.create -}}
    {{ default (include "rekor.redis.fullname" .) .Values.redis.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.redis.serviceAccount.name }}
{{- end -}}
{{- end -}}

{{/*
Create the name of the service account to use for the mysql component
*/}}
{{- define "rekor.serviceAccountName.mysql" -}}
{{- if .Values.mysql.serviceAccount.create -}}
    {{ default (include "rekor.mysql.fullname" .) .Values.mysql.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.mysql.serviceAccount.name }}
{{- end -}}
{{- end -}}

{{/*
Create the name of the service account to use for the Trillian Log Signer component
*/}}
{{- define "rekor.serviceAccountName.trillianLogSigner" -}}
{{- if .Values.trillianLogSigner.serviceAccount.create -}}
    {{ default (include "rekor.trillianLogSigner.fullname" .) .Values.trillianLogSigner.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.trillianLogSigner.serviceAccount.name }}
{{- end -}}
{{- end -}}

{{/*
Create the name of the service account to use for the Trillian Log Signer component
*/}}
{{- define "rekor.serviceAccountName.trillianLogServer" -}}
{{- if .Values.trillianLogServer.serviceAccount.create -}}
    {{ default (include "rekor.trillianLogServer.fullname" .) .Values.trillianLogServer.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.trillianLogServer.serviceAccount.name }}
{{- end -}}
{{- end -}}

{{/*
Create the image path for the passed in image field
*/}}
{{- define "rekor.image" -}}
{{- if eq (substr 0 7 .version) "sha256:" -}}
{{- printf "%s@%s" .repository .version -}}
{{- else -}}
{{- printf "%s:%s" .repository .version -}}
{{- end -}}
{{- end -}}

{{/*
Create Container Ports based on Service Ports
*/}}
{{- define "rekor.containerPorts" -}}
{{- range . }}
- containerPort: {{ (ternary .tagrgetPort .port (empty .targetPort)) | int }}
  protocol: {{ default "TCP" .protocol }}
{{- end -}}
{{- end -}}

{{/*
Log Server Arguments
*/}}
{{- define "rekor.trillianLogServer.args" -}}
- '--storage_system=mysql'
- '--mysql_uri=$(MYSQL_USER):$(MYSQL_PASSWORD)@tcp($(MYSQL_HOSTNAME):$(MYSQL_PORT))/$(MYSQL_DATABASE)'
- '--rpc_endpoint=0.0.0.0:8091'
- '--http_endpoint=0.0.0.0:8090'
- '--alsologtostderr'
{{- if .Values.trillianLogServer.extraArgs -}}
{{ toYaml .Values.trillianLogServer.extraArgs }}
{{- end -}}
{{- end -}}

{{/*
Log Signer Arguments
*/}}
{{- define "rekor.trillianLogSigner.args" -}}
- '--storage_system=mysql'
- '--mysql_uri=$(MYSQL_USER):$(MYSQL_PASSWORD)@tcp($(MYSQL_HOSTNAME):$(MYSQL_PORT))/$(MYSQL_DATABASE)'
- '--rpc_endpoint=0.0.0.0:8091'
- '--http_endpoint=0.0.0.0:8090'
- '--force_master'
- '--alsologtostderr'
{{- if .Values.trillianLogSigner.extraArgs -}}
{{ toYaml .Values.trillianLogSigner.extraArgs }}
{{- end -}}
{{- end -}}


{{/*
Server Arguments
*/}}
{{- define "rekor.server.args" -}}
- "serve"
- {{ printf "--trillian_log_server.address=%s" (include "rekor.trillianLogServer.fullname" .) | quote }}
- {{ printf "--trillian_log_server.port=%d" (.Values.trillianLogServer.port | int) | quote }}
- {{ printf "--redis_server.address=%s" (include "redis.hostname" .) | quote }}
- {{ printf "--redis_server.port=%d" (.Values.redis.port | int) | quote }}
- "--rekor_server.address=0.0.0.0"
- "--rekor_server.signer=memory"
{{- if .Values.server.attestation_storage.enabled }}
- "--enable_attestation_storage"
- {{ printf "--attestation_storage_bucket=%s" (.Values.server.attestation_storage.bucket) | quote }}
{{- end -}}
{{- if .Values.server.logging.production -}}
- "--log_type=prod"
{{- end -}}
{{- if .Values.server.extraArgs -}}
{{ toYaml .Values.server.extraArgs }}
{{- end -}}
{{- end -}}

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
{{- if (semverCompare "<1.18-0" .Capabilities.KubeVersion.Version) -}}
{{- print "false" -}}
{{- else -}}
{{- print "true" -}}
{{- end -}}
{{- end -}}

{{/*
Return the appropriate apiVersion for ingress.
*/}}
{{- define "rekor.server.ingress.backend" -}}
{{- $apiVersion := (include "ingress.apiVersion" .) -}}
{{- $serviceName := (include "rekor.server.fullname" .) -}}
{{- if or (eq $apiVersion "extensions/v1beta1") (eq $apiVersion "networking.k8s.io/v1beta1") -}}
serviceName: {{ $serviceName }}
servicePort: {{ .Values.server.port }}
{{- else -}}
service:
  name: {{ $serviceName }}
  port:
    number: {{ .Values.server.port | int }}
{{- end -}}
{{- end -}}

{{/*
Determine whether the Attestation storage is file based.
*/}}
{{- define "rekor.server.fileAttestationStorage" -}}
{{- if .Values.server.attestation_storage.enabled -}}
{{- if eq (substr 0 7 .Values.server.attestation_storage.bucket) "file://" -}}
{{- print "true" -}}
{{- else -}}
{{- print "false" -}}
{{- end -}}
{{- else -}}
{{- print "false" -}}
{{- end -}}
{{- end -}}

{{/*
Return the location for file based Attestation storage.
*/}}
{{- define "rekor.server.fileAttestationStorage.path" -}}
{{- print (substr 7 -1 .Values.server.attestation_storage.bucket) -}}
{{- end -}}