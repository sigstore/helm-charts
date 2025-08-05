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
Create a fully qualified Rekor backfillredis name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "rekor.backfillredis.fullname" -}}
{{- if .Values.backfillredis.fullnameOverride -}}
{{- .Values.backfillredis.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-%s" .Release.Name .Values.backfillredis.name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-%s" .Release.Name $name .Values.backfillredis.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}


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
Create a fully qualified mysql name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "rekor.mysql.fullname" -}}
{{- if (.Values.mysql).fullnameOverride -}}
{{- .Values.mysql.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-%s" .Release.Name (default "mysql" (.Values.mysql).name) | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-%s" .Release.Name $name (default "mysql" (.Values.mysql).name) | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Return the hostname for mysql
*/}}
{{- define "mysql.hostname" -}}
{{- default (include "rekor.mysql.fullname" .) (.Values.mysql).hostname }}
{{- end -}}

{{/*
Return the database for mysql
*/}}
{{- define "mysql.database" -}}
{{- default (include "rekor.fullname" .) (.Values.mysql).database }}
{{- end -}}

{{/*
Return the secret with mysql credentials
*/}}
{{- define "mysql.secretName" -}}
    {{- if ((.Values.mysql).auth).existingSecret -}}
        {{- printf "%s" .Values.mysql.auth.existingSecret -}}
    {{- else -}}
        {{- printf "%s" (include "rekor.mysql.fullname" .) -}}
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
Create the name of the service account to use for the createtree component
*/}}
{{- define "rekor.serviceAccountName.createtree" -}}
{{- if .Values.createtree.serviceAccount.create -}}
    {{ default (include "rekor.createtree.fullname" .) .Values.createtree.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.createtree.serviceAccount.name }}
{{- end -}}
{{- end -}}

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
Create Container Ports based on Service Ports
*/}}
{{- define "rekor.containerPorts" -}}
{{- range . }}
- containerPort: {{ (ternary .port .targetPort (empty .targetPort)) | int }}
  protocol: {{ default "TCP" .protocol }}
{{- end -}}
{{- end -}}

{{/*
Server Arguments
*/}}
{{- define "rekor.server.args" -}}
- "serve"
- {{ printf "--trillian_log_server.address=%s.%s" .Values.trillian.logServer.name .Values.trillian.forceNamespace | quote }}
- {{ printf "--trillian_log_server.port=%d" (.Values.trillian.logServer.portRPC | int) | quote }}
- {{ printf "--trillian_log_server.sharding_config=%s/%s" .Values.server.sharding.mountPath .Values.server.sharding.filename | quote }}
- {{ printf "--redis_server.address=%s" (include "redis.hostname" .) | quote }}
- {{ printf "--redis_server.port=%d" (.Values.redis.port | int) | quote }}
{{- if (.Values.server.searchIndex).storageProvider }}
- {{ printf "--search_index.storage_provider=%s" (.Values.server.searchIndex.storageProvider) | quote }}
{{- end }}
{{- if eq (.Values.server.searchIndex).storageProvider "mysql" }}
{{- if and (.Values.mysql.gcp.enabled) (.Values.mysql.gcp.cloudsql.unixDomainSocket.enabled) }}
{{- if .Values.mysql.gcp.cloudsql.iamUsername }}
- {{ printf "--search_index.mysql.dsn=$(%s)@unix(%s/%s)/$(MYSQL_DATABASE)?parseTime=true" .Values.mysql.gcp.cloudsql.iamUsername .Values.mysql.gcp.cloudsql.unixDomainSocket.path .Values.mysql.gcp.instance | quote }}
{{- else }}
- {{ printf "--search_index.mysql.dsn=$(MYSQL_USER):$(MYSQL_PASSWORD)@unix(%s/%s)/$(MYSQL_DATABASE)?parseTime=true" .Values.mysql.gcp.cloudsql.unixDomainSocket.path .Values.mysql.gcp.instance | quote }}
{{- end }}
{{- else }}
- "--search_index.mysql.dsn=$(MYSQL_USER):$(MYSQL_PASSWORD)@tcp($(MYSQL_HOSTNAME):$(MYSQL_PORT))/$(MYSQL_DATABASE)"
{{- end }}
{{- end }}
{{- if ((.Values.server.searchIndex).mysql).connMaxIdletime }}
- {{ printf "--search_index.mysql.conn_max_idletime=%s" (.Values.server.searchIndex.mysql.connMaxIdletime) | quote }}
{{- end }}
{{- if ((.Values.server.searchIndex).mysql).connMaxLifetime }}
- {{ printf "--search_index.mysql.conn_max_lifetime=%s" (.Values.server.searchIndex.mysql.connMaxLifetime) | quote }}
{{- end }}
{{- if ((.Values.server.searchIndex).mysql).maxOpenConnections }}
- {{ printf "--search_index.mysql.max_open_connections=%d" (.Values.server.searchIndex.mysql.maxOpenConnections | int) | quote }}
{{- end }}
{{- if ((.Values.server.searchIndex).mysql).maxIdleConnections }}
- {{ printf "--search_index.mysql.max_idle_connections=%d" (.Values.server.searchIndex.mysql.maxIdleConnections | int) | quote }}
{{- end }}
- "--rekor_server.address=0.0.0.0"
- {{ printf "--rekor_server.signer=%s" (.Values.server.signer) | quote }}
{{- if .Values.server.retrieve_api.enabled }}
- "--enable_retrieve_api=true"
{{- end }}
- "--trillian_log_server.tlog_id=$(TREE_ID)"
{{- if .Values.server.attestation_storage.enabled }}
- "--enable_attestation_storage"
- {{ printf "--attestation_storage_bucket=%s" (.Values.server.attestation_storage.bucket) | quote }}
{{- end -}}
{{- if .Values.server.logging.production }}
- "--log_type=prod"
{{- end -}}
{{-  range .Values.server.extraArgs }}
- {{ . | quote }}
{{ end }}
{{- end -}}

{{/*
Return the port for the external service listener
*/}}
{{- define "rekor.server.port" -}}
{{ (index .Values.server.service.ports 0).port | int }}
{{- end -}}

{{/*
Return the appropriate apiVersion for ingress.
*/}}
{{- define "rekor.server.ingress.backend" -}}
service:
  name: {{ include "rekor.server.fullname" . }}
  port:
    number: {{ include "rekor.server.port" . }}
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

{{/*
Return a random Secret value or the value of an exising Secret key value
*/}}
{{- define "rekor.randomSecret" -}}
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
Create the name of the config
*/}}
{{- define "rekor.config" -}}
{{ printf "%s-config" (include "rekor.fullname" .) }}
{{- end }}

{{/*
Create the name of the sharding config
*/}}
{{- define "rekor.sharding-config" -}}
{{ printf "%s-sharding-config" (include "rekor.fullname" .) }}
{{- end }}

{{/*
Place default environment credentials setup
*/}}
{{- define "searchIndex.mysql.envCredentials" -}}
{{- if ((.Values.server.searchIndex).mysql).envCredentials }}
{{ toYaml .Values.server.searchIndex.mysql.envCredentials }}
{{- else }}
- name: MYSQL_USER
  valueFrom:
    secretKeyRef:
        name: {{ template "mysql.secretName" . }}
        key: mysql-user
- name: MYSQL_PASSWORD
  valueFrom:
    secretKeyRef:
        name: {{ template "mysql.secretName" . }}
        key: mysql-password
- name: MYSQL_DATABASE
  valueFrom:
    secretKeyRef:
        name: {{ template "mysql.secretName" . }}
        key: mysql-database
- name: MYSQL_HOSTNAME
  value: {{ template "mysql.hostname" . }}
- name: MYSQL_PORT
  value: {{ default "3306" (.Values.mysql).port | quote }}
{{- end }}
{{- end }}
