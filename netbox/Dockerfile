FROM python:3.9.16-bullseye


WORKDIR /root

# Installing NetBox and requirements
RUN apt-get update
RUN apt-get install -y postgresql python3 python3-pip python3-venv python3-dev build-essential libxml2-dev libxslt1-dev libffi-dev libpq-dev libssl-dev zlib1g-dev
RUN wget https://github.com/netbox-community/netbox/archive/refs/tags/v3.4.8.tar.gz
RUN tar -xzf v3.4.8.tar.gz
RUN mv /root/netbox-3.4.8/ /opt/netbox/
RUN adduser --system --group netbox
COPY ./configuration.py /opt/netbox/netbox/netbox/configuration.py
RUN chown --recursive netbox /opt/netbox/netbox/media/
RUN /opt/netbox/upgrade.sh
RUN source /opt/netbox/venv/bin/activate
RUN python3 /opt/netbox/netbox/manage.py createsuperuser





# RUN python3 /opt/netbox/netbox/manage.py runserver 0.0.0.0:8000 --insecure