# SSL config

## Create tls command

```shell
openssl req -x509 -newkey rsa:4096 -sha256 -nodes -keyout tls.key -out tls.crt -subj "/CN=web-app.com" -days 36
```

## Create secret tls

```shell
kubectl create secret tls web-app-tls --cert=tls.crt --key=tls.key
```

## Connect from MacOS to Minikube Ingress Addons

```shell
# Install via Homebrew
$ brew install chipmk/tap/docker-mac-net-connect

# Run the service and register it to launch at boot
$ sudo brew services start chipmk/tap/docker-mac-net-connect
```
