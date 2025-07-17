#!/bin/bash

# 检查是否提供了足够的参数
if [ "$#" -lt 3 ]; then
    echo "用法: $0 <对方地址> <网卡名称> <传输文件的地址> [--reset]"
    exit 1
fi

# 定义 offset 文件路径
OFFSET_FILE="offset.txt"

# 在脚本开始时初始化 offset.txt 为 0
echo "0" > "$OFFSET_FILE"

# 记录总的开始时间
TOTAL_START_TIME=$(date +%s)

# 使用输入的参数
REMOTE_ADDR="$1"      # 对方地址
INTERFACE="$2"        # 网卡名称
FILE_PATH="$3"        # 传输文件的地址


# 运行 test_client
stdbuf -o0 ../build/tests/test_client -a "$REMOTE_ADDR" -p 8443 -6 -l e -E "normal-test" -i "$INTERFACE" -F "$FILE_PATH" > test.log

TOTAL_END_TIME=$(date +%s)

# 计算总用时
TOTAL_ELAPSED_TIME=$(( TOTAL_END_TIME - TOTAL_START_TIME ))
echo "Total execution time: $TOTAL_ELAPSED_TIME seconds"