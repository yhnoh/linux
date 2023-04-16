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
