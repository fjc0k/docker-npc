# docker-npc

在 [Docker](https://www.docker.com/) 中运行 [nps](https://github.com/cnlh/nps) 的客户端。

## 要求和限制

- 暂仅支持 `Windows` 和 `Mac` 设备。

  你的设备上必须安装 Docker 桌面版（**其中 Docker 引擎版本应在 18.03 及以上**），若尚未安装，点击以下链接进入下载安装：

  - [Install Docker Desktop for Windows](https://docs.docker.com/docker-for-windows/install/)
  - [Install Docker Desktop for Mac](https://docs.docker.com/docker-for-mac/install/)

- 务必使用 `host.docker.internal` 代替 `127.0.0.1`。

  因为这是将 npc 运行在 Docker 容器内，因此，`127.0.0.1` 指向的是容器，而非容器的宿主，即你的设备。

  于是，在后台添加项目时，请将其配置项的 `内网目标(ip:端口)` 中的 `127.0.0.1` 替换为 `host.docker.internal`。

## 使用

[点击查看 nps 官方仓库中客户端的使用方法](https://github.com/cnlh/nps#%E5%AE%A2%E6%88%B7%E7%AB%AF)，Docker 版的使用方法完全一样，仅仅需要将命令 `./npc` 替换为 `docker run --rm jayfong/npc` 即可，比如：

```bash
# 官方版
./npc -server=ip:port -vkey=web界面中显示的密钥

# Docker 版
docker run --rm jayfong/npc -server=ip:port -vkey=web界面中显示的密钥
```

```bash
# 官方版
./npc -config=npc配置文件路径

# Docker 版
docker run --rm -v ${PWD}/npc.conf:/npc/npc.conf jayfong/npc -config=/npc/npc.conf
```

## 升级

使用以下命令升级：

```bash
docker pull jayfong/npc
```

## 许可

Jay Fong © MIT
