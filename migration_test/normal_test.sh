#!/bin/bash

# 定义 offset 文件路径
OFFSET_FILE="offset.txt"

# 在脚本开始时初始化 offset.txt 为 0
echo "0" > "$OFFSET_FILE"

# 使用输入的网卡名称
INTERFACE="$1"

# 记录总的开始时间
TOTAL_START_TIME=$(date +%s)

stdbuf -o0 ../build/tests/test_client -a 192.168.1.125 -p 8443 -l e -E -Y "normal-test" -i "$INTERFACE" > test.log

TOTAL_END_TIME=$(date +%s)

# 计算总用时
TOTAL_ELAPSED_TIME=$(( TOTAL_END_TIME - TOTAL_START_TIME ))
echo "Total execution time: $TOTAL_ELAPSED_TIME seconds"