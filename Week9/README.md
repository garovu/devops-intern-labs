
Create tls command
```
openssl req -x509 -newkey rsa:4096 -sha256 -nodes -keyout tls.key -out tls.crt -subj "/CN=web-app.com" -days 36
```

Create secret tls
```
kubectl create secret tls web-app-tls --cert=tls.crt --key=tls.key
```