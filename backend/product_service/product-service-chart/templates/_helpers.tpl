{{- define "product-service.name" -}}
product-service
{{- end }}

{{- define "product-service.fullname" -}}
{{ .Release.Name }}
{{- end }}