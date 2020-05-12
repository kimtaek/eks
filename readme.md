![Github Action](https://github.com/kimtaek/eks/workflows/Build/badge.svg)

### usage

```bash
docker run --rm \
   -e PLUGIN_SERVER=https://D34...DE.ap-northeast-2.eks.amazonaws.com \
   -e PLUGIN_ACCOUNT=deployer \
   -e PLUGIN_TOKEN=ZXlKaGJHY2lPaUpTVXp... \
   -e PLUGIN_CERT=LS0tLS1... \
   -e PLUGIN_NAMESPACE=develop \
   -e PLUGIN_DEPLOYMENT=api \
   -e PLUGIN_CONTAINER=api \
   -e PLUGIN_REGISTRY=*.dkr.ecr.ap-northeast-2.amazonaws.com \
   -e PLUGIN_REPOSITORY=my/repository \
   -e PLUGIN_TAG=hash \
   -e PLUGIN_DEBUG=true \
   -e PLUGIN_WATCH=true \
   kimtaek/eks
```

##### [optional] PLUGIN_ACCOUNT (default: `deployer`)
##### [optional] PLUGIN_DEBUG (default: `false`)
```bash
echo env
```

##### [optional] PLUGIN_WATCH (default: `false`)
```bash
Waiting for deployment "api" rollout to finish: 2 old replicas are pending termination...
Waiting for deployment "api" rollout to finish: 1 old replicas are pending termination...
Waiting for deployment "api" rollout to finish: 1 of 2 updated replicas are available...
deployment "api" successfully rolled out
```