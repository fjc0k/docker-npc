#!/bin/bash

NPC_VERSION=$(grep -o "NPC_VERSION=.*" Dockerfile | sed "s/NPC_VERSION=//g")

git tag -a "$NPC_VERSION" -m "npc v$NPC_VERSION"
git push origin --follow-tags
