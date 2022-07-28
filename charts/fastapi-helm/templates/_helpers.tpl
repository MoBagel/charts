{{/*
Expand the name of the chart.
*/}}
{{- define "fastapi-helm.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "fastapi-helm.fullname" -}}
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

{{/* Create chart name and version as used by the chart label. */}}
{{- define "fastapi-helm.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/* Common labels */}}
{{- define "fastapi-helm.labels" -}}
helm.sh/chart: {{ include "fastapi-helm.chart" . }}
{{ include "fastapi-helm.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/* Selector labels */}}
{{- define "fastapi-helm.selectorLabels" -}}
app.kubernetes.io/name: {{ include "fastapi-helm.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/* Create the name of the service account to use */}}
{{- define "fastapi-helm.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "fastapi-helm.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/* The name of config map */}}
{{- define "fastapi-helm.configmapName" -}}
{{- .Release.Name }}-configmap
{{- end }}

{{/* Google service account json file volume */}}
{{- define "fastapi-helm.google_service_account" }}
- name: google-service-account
  secret:
    secretName: {{ .Values.application.googleServiceAccountSecret }}
    defaultMode: 288
{{- end }}

