#!/bin/bash

JSON_FILE="Montplier.json"  # Replace with your JSON filename
SEED="${1:-$(date +%s)}"
CHANGE_CNT=0

# 网络接口
INTERFACE1="enp6s19"
INTERFACE2="enp6s20"
JITTER="5ms"
# UP_LOSS_RATE=0.45%
# DOWN_LOSS_RATE=0.4%
UP_LOSS_RATE=0%
DOWN_LOSS_RATE=0%
# BANDWIDTH="100mbit"

# 删除旧的配置
tc qdisc del dev $INTERFACE1 root 2> /dev/null
tc qdisc del dev $INTERFACE2 root 2> /dev/null

tc qdisc add dev $INTERFACE1 root handle 1: htb default 1
tc class add dev $INTERFACE1 parent 1: classid 1:1 htb rate 100mbit
tc qdisc add dev $INTERFACE1 parent 1:1 handle 10: netem delay 15ms 5ms 70% distribution custom351 loss 0%

tc qdisc add dev $INTERFACE2 root handle 1: htb default 1
tc class add dev $INTERFACE2 parent 1: classid 1:1 htb rate 100mbit
tc qdisc add dev $INTERFACE2 parent 1:1 handle 20: netem delay 15ms 5ms 70% distribution custom351 loss 0%

# 主循环
while true; do
  CURRENT_SECOND=$(date +%S)

  if [[ "$CURRENT_SECOND" == "12" || "$CURRENT_SECOND" == "27" || "$CURRENT_SECOND" == "42" || "$CURRENT_SECOND" == "57" ]]; then
    CHANGE_CNT=$(($CHANGE_CNT + 1))
    # 选一个随机小时
    TOTAL_ENTRIES=$(jq '.byHour | length' "$JSON_FILE")
    RANDOM_INDEX=$((SEED % TOTAL_ENTRIES))
    ENTRY=$(jq ".byHour[$RANDOM_INDEX]" "$JSON_FILE")

    # 提取下载速率（bps）和延迟（ms）
    DOWNLOAD=$(echo "$ENTRY" | jq '.download')
    PING=$(echo "$ENTRY" | jq '.mainPing')

    # 下载值转换为 Mbps（近似）
    DOWNLOAD_MBPS=$(awk "BEGIN {printf \"%.2f\", $DOWNLOAD / 125000}")  # 1 Mbps = 125000 Bytes/s
    BANDWIDTH="${DOWNLOAD_MBPS}mbit"

    # 延迟减半
    HALF_DELAY=$(awk "BEGIN {printf \"%.2f\", $PING / 2}")
    DELAY="${HALF_DELAY}ms"

    # 计算随机丢包率 (0.4%~1%)
    RAND_LOSS=$(awk -v seed="$SEED" "BEGIN {srand(seed); print 0.4 + (rand() * 0.6)}")
    LOSS_RATE=$(printf "%.2f" $RAND_LOSS)"%"
    SEED=$(($SEED + 1))

    # 设置 tc 配置
    if [[ "$CHANGE_CNT" == "3" || "$CHANGE_CNT" == "6" ]]; then
      echo "hadover"
      tc qdisc del dev $INTERFACE1 root 2> /dev/null
      tc qdisc del dev $INTERFACE2 root 2> /dev/null

      tc qdisc add dev $INTERFACE1 root handle 1: htb default 1
      tc class add dev $INTERFACE1 parent 1: classid 1:1 htb rate $BANDWIDTH
      # tc qdisc add dev $INTERFACE1 parent 1:1 handle 10: netem delay $DELAY $JITTER 70% distribution custom351 loss $DOWN_LOSS_RATE
      tc qdisc add dev $INTERFACE1 parent 1:1 handle 10: netem delay $DELAY loss $DOWN_LOSS_RATE

      tc qdisc add dev $INTERFACE2 root handle 1: htb default 1
      tc class add dev $INTERFACE2 parent 1: classid 1:1 htb rate $BANDWIDTH
      # tc qdisc add dev $INTERFACE2 parent 1:1 handle 20: netem delay $DELAY $JITTER 70% distribution custom351 loss $UP_LOSS_RATE
      tc qdisc add dev $INTERFACE2 parent 1:1 handle 20: netem delay $DELAY loss $UP_LOSS_RATE
    else
      echo "reconfig"
      tc class replace dev $INTERFACE1 parent 1: classid 1:1 htb rate $BANDWIDTH
      tc class replace dev $INTERFACE2 parent 1: classid 1:1 htb rate $BANDWIDTH
      # tc qdisc replace dev $INTERFACE1 parent 1:1 handle 10: netem delay $DELAY $JITTER 70% distribution custom351 loss $DOWN_LOSS_RATE
      tc qdisc replace dev $INTERFACE1 parent 1:1 handle 10: netem delay $DELAY loss $DOWN_LOSS_RATE
      # tc qdisc replace dev $INTERFACE2 parent 1:1 handle 20: netem delay $DELAY $JITTER 70% distribution custom351 loss $UP_LOSS_RATE
      tc qdisc replace dev $INTERFACE2 parent 1:1 handle 20: netem delay $DELAY loss $UP_LOSS_RATE
    fi

    echo "$(date +%T) - 配置已更新：带宽=${BANDWIDTH} 延迟=${DELAY}*2 上行链路丢包率=${UP_LOSS_RATE} 下行链路丢包率=${DOWN_LOSS_RATE} (索引: $RANDOM_INDEX)"
    # echo "${BANDWIDTH}-${DELAY}"

    sleep 1
  fi

  sleep 0.01
done
