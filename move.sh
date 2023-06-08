#!/bin/bash

SOURCE_DIR="/data/qbittorrent/downloads/水野朝陽/"
LOCK_FILE="${SOURCE_DIR}.source.lock"

# 检查锁文件是否存在
if [ -f "$LOCK_FILE" ]; then
  echo "锁文件存在，退出脚本。"
  exit 1
fi

# 创建锁文件
touch "$LOCK_FILE"

# 执行 rclone move 命令
rclone move -v "$SOURCE_DIR" giegie:"/giegie/水野朝陽" --transfers=10 --progress --exclude "*.!qB"  --min-size 5

# 删除锁文件
rm "$LOCK_FILE"
