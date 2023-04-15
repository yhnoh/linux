FROM ubuntu:20.04

RUN apt-get update && \
    apt-get install -y vim openssh-server

RUN mkdir ~/.ssh && \
    touch ~/.ssh/authorized_keys

## rsa 형식, ~/.ssh에 id_rsa 이름, 비밀번호 공백 
RUN ssh-keygen -m PEM -t rsa -f ~/.ssh/id_rsa -N "" && \
    cat ~/.ssh/id_rsa.pub > ~/.ssh/authorized_keys
 

EXPOSE 22

CMD ["sleep", "infinity"]
