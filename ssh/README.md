### SSH (Secure Shell)란?
---

- ***원격 호스트에 접속하기 위해 사용되는 보안 프로토콜***이다.
- 원격 호스트에 접속을 하기는 하는데 일반적인 GUI화면이 아닌 Shell로 원격 호스트를 제어한다.
  > Shell이란 검은화면에 흰색 글자를 입력하는 CLI(Command Line Interface)를 생각하면 된다.
- 강력한 암호화 방식으로 연결되어 있기 때문에 ***데이터를 중간에 가로채도 해석할 수 없는 암호화된 문자만이 노출***된다.
  - HTTP와 HTTPS의 차이와 비슷하다.  


### SSH 접속해보기
---

#### 환경 설정

1. Dockerfile을 이용하여 ubunutu 서버 구축
```Dockerfile
FROM ubuntu:20.04


### ssh 사용하기 위하여 openssh-server 설치
RUN apt-get update && \
    apt-get install -y vim openssh-server net-tools

RUN mkdir ~/.ssh

## rsa 형식, ~/.ssh에 키 이름 = id_rsa, 비밀번호 공백 
## id_rsa.pub 출력 스트림을 authorized_keys에 삽입
RUN ssh-keygen -m PEM -t rsa -f ~/.ssh/id_rsa -N "" && \
    cat ~/.ssh/id_rsa.pub > ~/.ssh/authorized_keys


EXPOSE 22
```

2. Docker image build 및 container 생성
```bash
## Dockerfile을 통한 이미지 빌드
docker build -t [image id] .

## --privileged : 도커 컨테이너를 privileged 모드로 실행
## /usr/sbin/init : init 스크립트 실행
## -p 2222:22 : 도커 서버 22번 포트를 호스트 PC에 2222으로 매핑
docker run --privileged --name [container id] -p 2222:22 -d [image id] /usr/sbin/init

## docker container 접속
docker exec -it [container id] bin/bash

## ssh 서비스 확인
systemctl status sshd
netstat -tnlp | grep 22
```


#### 1. docker ubuntu 서버 프라이빗 키를 이용해 접속

```bash
## docker 서버 접속 이후 ~/.ssh/id_rsa 파일 확인
docker exec -it [container id] bin/bash
cat ~/.ssh/id_rsa

## 원격 서버 private key를 호스트 PC에 저장
ssh -i [원격 서버 private key] -p 2222 root@localhost
```

 - 도커 우분투 서버 22번 포트를 호스트 PC에 2222으로 매핑했기 때문에 -p 옵션을 통해서 2222으로 접속
   - 옵션을 주지 않으면 22번 포트를 통해서 원격 서버에 접속을 할 수 있다.

#### 2. 호스트 pc 프라이빗 키를 이용해 접속

```bash
## 호스트 PC 키 생성
ssh-keygen -m PEM -t rsa -f ~/.ssh/id_rsa -N ""
## 원격 서버로 호스트 PC 공개키 전송
scp -i [원격 서버 private key] -P 2222 ~/.ssh/id_rsa.pub root@localhost:/root

## 원격 서버 접속하여 호스트 PC 공개키 authorized_keys에 삽입  
ssh -i [원격 서버 private key] -p 2222 root@localhost
cat id_rsa.pub >> .ssh/authorized_keys

## 원격 서버 private key 없이 접속 확인
ssh -p 2222 root@localhost
```



https://opentutorials.org/module/432/3742

https://www.lesstif.com/software-architect/ssh-load-key-invalid-format-openssh-rsa-106856464.html

> ssh-keygen 관련 옵션 : https://ydeer.tistory.com/298