#!/bin/bash

# 执行 test_server 并将输出重定向到 output 文件
../build/test/test_server -w test.mp4 -l d > output

# 从 output 文件中提取所需的三行字段
line1=$(grep "test-type" output | awk '{print $NF}')
line2=$(grep "content-length" output | awk '{print $NF}')
line3=$(grep "total-time" output | awk '{print $NF}')

# 输出结果到 result.txt，使用续写的方式
{
    echo "测试类型: $line1"
    echo "内容长度: $line2"
    echo "时间: $line3"
    echo " "
} >> result.txt