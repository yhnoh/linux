#!/bin/bash

## 해당 명령문이 에러일 경우 표준 스트림을 ng 파일, 명령문이 성공적으로 작동될 경우 표준 스트림을  ok 파일
ls -al 1>ok 2> ng
cat ng


## 중괄호를 사용하여 출력 스트림을 한꺼번에 redirect 가능하다.
touch report

cp -f /dev/null report

{
    echo "==== df ===="
    df -h
    echo
    echo "==== pstree ===="
    pstree
    echo
    echo "==== free ===="
    free -m
    echo
    echo "==== uptime ===="
    uptime
    echo
}>report


