{{/*
Expand the name of the chart.
*/}}
{{- define "web-app-minio.name" -}}
{{- default .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "web-app-minio.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "web-app-minio.selectorLabels" -}}
app.kubernetes.io/name: {{ include "web-app-minio.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "web-app-minio.labels" -}}
helm.sh/chart: {{ include "web-app-minio.chart" . }}
{{ include "web-app-minio.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}
