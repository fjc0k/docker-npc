#!/bin/sh

git config --global user.name "X-BOT"
git config --global user.email "fjc0kb@gmail.com"

git remote rm origin
git remote add origin https://${GITHUB_TOKEN}@github.com/fjc0k/docker-npc.git &> /dev/null

PROJECT_LATEST_TAG=$(wget -q -O- https://api.github.com/repos/fjc0k/docker-npc/tags | grep '"name":' | sed -E 's#.*"(.+)".*#\1#' | head -n1)
NPC_LATEST_TAG=$(wget -q -O- https://api.github.com/repos/cnlh/nps/releases/latest | grep '"tag_name":' | sed -E 's#.*"v(.+)".*#\1#' | head -n1)

echo "npc: $NPC_LATEST_TAG"
echo "docker-npc: $PROJECT_LATEST_TAG"

if [ $PROJECT_LATEST_TAG != $NPC_LATEST_TAG ]; then
  sed -i'' "s#NPC_VERSION=.*#NPC_VERSION=$NPC_LATEST_TAG#" Dockerfile
  git add Dockerfile
  git commit -m "feat: 升级 npc 版本 [$NPC_LATEST_TAG]"
  git tag -a "$NPC_LATEST_TAG" -m "npc v$NPC_LATEST_TAG"
  git push --set-upstream origin master --follow-tags --quiet &> /dev/null
fi
