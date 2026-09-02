{{/*
Create the image path for the passed in image field
*/}}
{{- define "scaffold.image" -}}
{{- $registryName := .registry -}}
{{- $repositoryName := .repository -}}
{{- $tag := .version -}}
{{- if .image -}}
  {{- $registryName = .image.registry -}}
  {{- $repositoryName = .image.repository -}}
  {{- $tag = .image.version -}}
{{- end -}}
{{- if .global -}}
  {{- if kindIs "map" .global.imageRegistry -}}
    {{- if hasKey .global.imageRegistry $registryName -}}
      {{- $registryName = index .global.imageRegistry $registryName -}}
    {{- end -}}
  {{- else if kindIs "string" .global.imageRegistry -}}
    {{- if .global.imageRegistry -}}
      {{- $registryName = .global.imageRegistry -}}
    {{- end -}}
  {{- end -}}
  {{- if kindIs "map" .global.imageRegistries -}}
    {{- if hasKey .global.imageRegistries $registryName -}}
      {{- $registryName = index .global.imageRegistries $registryName -}}
    {{- end -}}
  {{- end -}}
{{- end -}}
{{- if eq (substr 0 7 $tag) "sha256:" -}}
  {{- printf "%s/%s@%s" $registryName $repositoryName $tag -}}
{{- else -}}
  {{- printf "%s/%s:%s" $registryName $repositoryName $tag -}}
{{- end -}}
{{- end -}}
