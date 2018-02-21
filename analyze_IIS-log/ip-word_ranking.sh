#!/bin/bash

file=$1
word=$2

# 引数が2つ無かったら終了
if [ "$file" = "" ]; then
  echo "***Error*** 引数1にファイルを指定してください"
  exit 1
elif [ ! -e $file ]; then
  echo "***Error*** $file：が存在しません"
  exit 1
fi

if [ "$word" = "" ]; then
  echo "***Error*** 引数2に検索する単語（例：'GET /shop/zozoused/goods'）を指定してください"
  exit 1
fi

# 特定のwordでgrepした後、sort uniqでランキング形式でIPをカウント
grep -a "$word" $file |awk '{print $9}' |sort |uniq -c |sort -nr

