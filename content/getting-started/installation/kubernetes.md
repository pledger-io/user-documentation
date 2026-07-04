---
title: With Kubernetes
description: Deploy Pledger.io as a Kubernetes deployment with a service.
icon: fas dharmachakra
thumbnail: img/getting-started/installation/kubernetes.svg
show_thumbnail: false
type: docs
weight: 2
---
To deploy Pledger.io in a Kubernetes cluster you can use the following snippet.
This will create a deployment, pod and service registration in the Kubernetes cluster.

After this you should create your own reverse proxy to expose it, either using Nginx, Apache or a Traefik ingress.

{{< alert color="danger" icon="fas triangle-exclamation" >}}
    Kubernetes is an advanced platform and should only be used if you already have some experience.
{{< /alert >}}

## Kubernetes deployment

The following snippet can be used to deploy Pledger.io in a Kubernetes cluster.
This will start a single pod with a single container running Pledger.io.

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  annotations:
    description: Pledger.io
  labels:
    app: pledger
  name: pledger
spec:
  progressDeadlineSeconds: 600
  replicas: 1
  revisionHistoryLimit: 10
  selector:
    matchLabels:
      app: pledger
  strategy:
    rollingUpdate:
      maxSurge: 25%
      maxUnavailable: 25%
    type: RollingUpdate
  template:
    metadata:
      labels:
        app: pledger
    spec:
      dnsPolicy: ClusterFirst
      restartPolicy: Always
      terminationGracePeriodSeconds: 30
      containers:
        - image: ghcr.io/pledger-io/amd64-core:stable
          name: pledger
          ports:
            - name: http
              containerPort: 8080
          volumeMounts:
            - mountPath: 'opt/storage/logs'
              name: pledger-log-volume
            - mountPath: 'opt/storage/upload'
              name: pledger-data-volume
          livenessProbe:
            httpGet:
              path: /
              port: http
            initialDelaySeconds: 60
            failureThreshold: 5
            timeoutSeconds: 10
          readinessProbe:
            httpGet:
              path: /
              port: http
            initialDelaySeconds: 60
            failureThreshold: 5
            timeoutSeconds: 10
          env:
            - name: DB_TYPE
              value: "mysql"
            - name: DATABASE_HOST
              value: "pledger_db"
            - name: DATABASE_SCHEMA
              value: "pledger"
            - name: DATABASE_USER
              value: "pledger"
            - name: DATABASE_PASSWORD
              value: "pledger"
      volumes:
        - name: pledger-log-volume
          hostPath:
            path: '/mnt/data/pledger/logs'
        - name: pledger-data-volume
          hostPath:
            path: '/mnt/data/pledger/data'
```

## Kubernetes service

The following snippet can be used to create a service registration for Pledger.io in a Kubernetes cluster.

```yaml
apiVersion: v1
kind: Service
metadata:
  name: pledger
spec:
  selector:
    app: pledger
  ports:
    - protocol: TCP
      port: 8080
      targetPort: 8080
```

## Kubernetes ingress

The following snippet can be used to create an ingress registration for Pledger.io in a Kubernetes cluster.

{{< alert alert-type="info" >}}
  Your K8S cluster should have an ingress controller installed and configured.
{{< /alert >}}

```yaml
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: pledger
spec:
    rules:
      - host: pledger.example.com
        http:
          paths:
          - pathType: Prefix
            path: /
            backend:
              service:
                name: pledger
                port:
                  number: 8080
```
