#!/bin/bash

# 检查是否提供了网卡参数
if [ "$#" -lt 1 ]; then
    echo "用法: $0 <网卡名称> [--reset]"
    exit 1
fi

# 定义 offset 文件路径
OFFSET_FILE="offset.txt"

# 在脚本开始时初始化 offset.txt 为 0
echo "0" > "$OFFSET_FILE"

# 记录总的开始时间
TOTAL_START_TIME=$(date +%s)

# 使用输入的网卡名称
INTERFACE="$1"

# 检查是否有 --reset 参数
RESET_OPTION=""
if [ "$#" -eq 2 ] && [ "$2" == "--reset" ]; then
    RESET_OPTION="-j"
fi

# 运行 test_client
stdbuf -o0 ../build/tests/test_client -a 192.168.1.125 -p 8443 -l e -m -E "migration-test" -i "$INTERFACE" $RESET_OPTION > test.log

TOTAL_END_TIME=$(date +%s)

# 计算总用时
TOTAL_ELAPSED_TIME=$(( TOTAL_END_TIME - TOTAL_START_TIME ))
echo "Total execution time: $TOTAL_ELAPSED_TIME seconds"