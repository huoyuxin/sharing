# docker cli without desktop
https://dev.to/elliotalexander/how-to-use-docker-without-docker-desktop-on-macos-217m
https://velog.io/@dmdwns2/MacM1-limactl-is-running-under-rosetta-please-reinstall-lima-with-native-arch
colima start
# docker login https://hub.docker.com

# build an image in local
docker build -t thisisshui/egg_app:0123 -f docker/Dockerfile .;
# docker build --build-arg COMMIT_ID=$(git ls-remote https://github.com/huoyuxin/sharing.git refs/heads/master) -t thisisshui/egg_app:0123 -f docker/Dockerfile .;
# before push, create repository in https://hub.docker.com/repositories/thisisshui
docker push thisisshui/egg_app:0123;

curl 127.0.0.1:7001/health
# 会覆盖 CMD

# todo: -it vs --entrypoint bash
# todo: -it vs --entrypoint bash
# todo: -it vs --entrypoint bash
# todo: -it vs --entrypoint bash
# todo: -it vs --entrypoint bash

docker run -it thisisshui/egg_app:0123;
docker run --entrypoint bash thisisshui/egg_app:0123;

# 会覆盖 CMD
docker run -it -p 7001:7001 --entrypoint bash thisisshui/egg_app:0123;
docker run -p 7001:7001 thisisshui/egg_app:0123;
# 如何进入 bash
docker ps;
docker exec -it e50f81d7f662 bash;
# 不需要每次改 id
docker run --name thisisshui/egg_app -it -p 7001:7001 thisisshui/egg_app:0123;
docker exec -it thisisshui/egg_app bash;
# name 占用，clean
docker image prune -f; docker container prune -f

# env
echo $NODE_ENV
docker run -it -p 7001:7001 --entrypoint bash thisisshui/egg_app:0123;
docker run -it -p 7001:7001 --entrypoint bash --env NODE_ENV=test thisisshui/egg_app:0123;

# volume
ls ignore-dir;
docker run -it --entrypoint bash thisisshui/egg_app:0123;
docker run -it --entrypoint bash -v ~/sharing/egg-app-for-docker:/app/egg-app-for-docker thisisshui/egg_app:0123;

# network 多个容器间的交互
docker network create shui_network
docker run --name egg_app_1 thisisshui/egg_app:0123;
docker rm egg_app_1;
# correct
# docker run --name egg_app_1 --network shui_network thisisshui/egg_app:0123;
docker run --name egg_app_2 --network shui_network thisisshui/egg_app:0123;
docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' egg_app_1
docker exec -it egg_app_1 bash
curl 172.18.0.2:7001;

# platform
docker run --platform linux/amd64 thisisshui/egg_app:0123



# k8s
# https://minikube.sigs.k8s.io/docs/start/
# https://pet2cattle.com/2022/09/minikube-colima-macos-m1

docker build -t thisisshui/egg_app:0124_copy -f docker/Dockerfile .;

minikube config set driver docker
minikube start;
kubectl delete pod egg-app-pod; 
kubectl apply -f k8s/example.yaml;
kubectl describe pod egg-app-pod

kubectl exec -it egg-app-pod -c egg-app-container -- /bin/sh
curl http://localhost:7001/health
curl http://localhost:7001/boom

# todo: visit from machine
kubectl logs egg-app-pod
kubectl get service egg-app-service
kubectl get nodes -o wide
curl 192.168.49.2:32530/health


kubectl get pods
kubectl exec -it egg-app-pod -- /bin/sh
