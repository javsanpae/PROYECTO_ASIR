FROM ubuntu:jammy

RUN mkdir /ansible
RUN mkdir /ansible/playbooks
RUN mkdir /ansible/inventories
RUN mkdir /ansible/collections

RUN apt-get update
RUN apt-get install software-properties-common -y
RUN apt-add-repository ppa:ansible/ansible -y
RUN apt-get update
RUN apt-get install ansible -y