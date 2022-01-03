#!/bin/bash

# 终端可能已经有在运行的实例
killall -q clash

# 等待进程被终止
while pgrep -u $UID -x clash >/dev/null; do sleep 1; done

# 运行clash，使用默认的配置文件路径 ~/.config/clash/*
clash &
