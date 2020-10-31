---
apiVersion: apps/v1
kind: Deployment
metadata:
  labels:
    app: REPO
  name: REPO
spec:
  replicas: 2
  selector:
    matchLabels:
      app: REPO
  template:
    metadata:
      creationTimestamp: null
      labels:
        app: REPO
    spec:
      containers:
      - image: registry.gitlab.com/USER/REPO:master
        name: REPO
        env:
        - name: PORT
          value: "5000"
      imagePullSecrets:
      - name: regcred

---
apiVersion: v1
kind: Service
metadata:
  name: REPO
spec:
  type: NodePort
  ports:
    - name: REPO
      nodePort: 32000
      port: 5000
      targetPort: 5000
      protocol: TCP
  selector:
    app: 'REPO'
