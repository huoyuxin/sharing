https://linuxhint.com/use-docker-cli-mac-without-docker-desktop/
https://dev.to/elliotalexander/how-to-use-docker-without-docker-desktop-on-macos-217m
https://how.wtf/how-to-use-docker-without-docker-desktop-on-macos.html

安装 Homebrew:

如果你还没有安装 Homebrew，可以在终端中执行以下命令安装：

bash
Copy code
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
使用 Homebrew 安装 Docker CLI:

bash
Copy code
brew install docker
这将安装 Docker 引擎和 Docker CLI。

启动 Docker 引擎:

安装完成后，你可以通过以下命令启动 Docker 引擎：

bash
Copy code
sudo dockerd
请注意，这需要管理员权限（sudo），因为 Docker 引擎通常需要访问系统资源。

测试 Docker CLI:

在另一个终端窗口中，尝试运行 Docker CLI 命令，例如：

bash
Copy code
docker version
这应该显示 Docker 版本信息，表示 Docker CLI 成功安装并与 Docker 引擎通信。





brew install docker;
sudo docker info;

docker build -t egg_app:0123 -f docker/Dockerfile .;
docker push mingyuanxiaoshui/egg_app:0123;

# todo: curl 7001 端口
# todo: curl 7001 端口
# todo: curl 7001 端口

# 会覆盖 CMD
docker run -it -p 7001:7001 --entrypoint /bin/bash egg_app:0123;
docker run -it -p 7001:7001 egg_app:0123;
# 如何进入 bash
docker ps;
docker exec -it e50f81d7f662 /bin/bash;
# 不需要每次改 id
docker run --name egg_app -it -p 7001:7001 egg_app:0123;
docker exec -it egg_app /bin/bash;
# name 占用，clean
docker image prune -f; docker container prune -f
# doing: env
# doing: env
# doing: env
# doing: env
# doing: env
echo $NODE_ENV
docker run -it -p 7001:7001 --entrypoint /bin/bash --env NODE_ENV=test egg_app:0123;
# volume

docker run --name egg_app -it -p 7001:7001 -v /Users/yuxinhuo/project/shopee/seller/sharing/egg-app-for-docker:/app/egg-app-for-docker egg_app:0123;

# link