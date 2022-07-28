# FastAPI packaged by MoBagel

FastAPI is a modern, fast (high-performance), web framework for building APIs with Python 3.6+ based on standard Python type hints.

[Overview of FastAPI](https://fastapi.tiangolo.com/)

Trademarks: This software listing is packaged by MoBagel. The respective trademarks mentioned in the offering are owned by the respective companies, and use of them does not imply any affiliation or endorsement.

Install from this repository
```bash
helm install --namespace fastapi --create-namespace my-backend .
```

## Prerequisites

- Kubernetes 1.19+
- Helm 3.2.0+

## Installing the Chart

To install the chart with the release name `my-release` under namespace `my-namespace` using github repository:

```console
$ helm repo add mobagel https://mobagel.github.io/charts
$ helm install --namespace my-namespace --create-namespace my-release mobagel/fastapi
```

## Parameters

### Application
| Name                        | Description                                                             | Value             |
|-----------------------------|-------------------------------------------------------------------------|-------------------|
| envs                        | a dictionary of pod environment variables for fastapi pod container     |        `{}`       |
| googleServiceAccountSecret  | (optional) the secret name containing google's service account json key | `service-account` |

### Image
| Name         | Description                                                              | Value             |
|--------------|--------------------------------------------------------------------------|-------------------|
| repository   | your fastapi backend image repository                                    |        `{}`       |
| tag          | (optional) Overrides the image tag whose default is the chart appVersion | `service-account` |
