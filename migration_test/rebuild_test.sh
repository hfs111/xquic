#!/bin/bash

# 定义 offset 文件路径
OFFSET_FILE="offset.txt"

# 在脚本开始时初始化 offset.txt 为 0
echo "0" > "$OFFSET_FILE"

# 使用输入的网卡名称
INTERFACE="$1"

# 记录总的开始时间
TOTAL_START_TIME=$(date +%s)

# 循环直到 offset 值大于或等于 20971520
while true; do
    # 读取 offset 文件中的值
    if [[ -f "$OFFSET_FILE" ]]; then
        OFFSET_VALUE=$(<"$OFFSET_FILE")
        echo "Current offset value: $OFFSET_VALUE"  # 输出当前 offset 值
    else
        echo "Error: $OFFSET_FILE does not exist."
        exit 1
    fi

    # 判断 offset 值是否小于 20971520
    if (( OFFSET_VALUE < 20971520 )); then
        echo "Offset is less than 20971520. Executing test_client..."

        # 执行命令并重定向输出
        stdbuf -o0 ../build/test/test_client -a 192.168.1.125 -p 8443 -E -Y "rebuild-test" -i "$INTERFACE" > test.log
    else
        echo "Offset is greater than or equal to 20971520. Exiting."
        break
    fi
done

# 记录总的结束时间
TOTAL_END_TIME=$(date +%s)

# 计算总用时
TOTAL_ELAPSED_TIME=$(( TOTAL_END_TIME - TOTAL_START_TIME ))
echo "Total execution time: $TOTAL_ELAPSED_TIME seconds"