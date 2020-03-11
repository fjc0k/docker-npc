######## 源码 ########
FROM alpine as source

ENV NPC_VERSION=0.26.5
ENV NPC_DOWNLOAD_URL=https://github.com/cnlh/nps/releases/download/v${NPC_VERSION}/linux_amd64_client.tar.gz

WORKDIR /npc

RUN apk add --update --no-cache wget
RUN mkdir tmp \
  && cd tmp \
  && wget ${NPC_DOWNLOAD_URL} \
  && tar -xzf *.tar.gz \
  && mv $(find -name npc) ../npc \
  && cd .. \
  && rm -rf tmp \
  && chmod +x npc


######## 镜像 ########
FROM busybox

WORKDIR /npc

COPY --from=source /npc .

ENTRYPOINT ["./npc"]
