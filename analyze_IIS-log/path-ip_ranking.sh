#!/bin/bash

file=$1
ip=$2

# 引数が2つ無かったら終了
if [ "$file" = "" ]; then
  echo "***Error*** 引数1にファイルを指定してください"
  exit 1
elif [ ! -e $file ]; then
  echo "***Error*** $file：が存在しません"
  exit 1
fi

if [ "$ip" = "" ]; then
  echo "***Error*** 引数2に検索するip（例：'150.95.190.25'）を指定してください"
  exit 1
fi

# 特定のipでgrepした後、sort uniqでランキング形式でパスをカウント
grep -a -w "$ip" $file |awk '{print $5" "$6}' |sort |uniq -c |sort -nr

