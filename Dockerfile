FROM williamyeh/ansible:ubuntu14.04-onbuild
MAINTAINER Sreeprakash Neelakantan <sree@schogini.com>

# COPY ansible/hosts /etc/ansible/hosts
# COPY ansible/playbook.yml /etc/ansible/playbook.yml
# COPY ansible/ansible.cfg /etc/ansible/ansible.cfg

#

RUN apt-get update && apt-get -y install python-pip git && pip install -U boto

RUN cd /etc && rm -fr ansible && git clone https://github.com/schogini/ansible.git

ENV INVENTORY /etc/ansible/hosts
ENV ANSIBLE_HOST_KEY_CHECKING False
ENV PLAYBOOK /etc/ansible/playbook.yml

COPY ./Dockerfile /

