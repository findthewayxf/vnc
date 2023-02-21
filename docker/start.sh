#!/bin/bash

# 启动 Xvfb
Xvfb :0 -screen 0 1440x900x16 &

# 启动 x11vnc
x11vnc -forever -usepw -create
