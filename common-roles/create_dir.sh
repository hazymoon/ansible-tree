#!/bin/bash
# 引数名のディレクトリ以下を自動作成
mkdir -p $@/{defaults,files,handlers,tasks,templates}
touch $@/tasks/main.yml
touch $@/defaults/main.yml
