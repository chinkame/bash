#!/bin/bash

file=$1

# 引数が1つ無かったら終了
if [ "$file" = "" ]; then
  echo "***Error*** 引数1にファイルを指定してください"
  exit 1
elif [ ! -e $file ]; then
  echo "***Error*** $file：が存在しません"
  exit 1
fi

# sort uniqでランキング形式でパスをカウント
cat $file |awk '{print $5" "$6}' |sort |uniq -c |sort -nr |head -100

