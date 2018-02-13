ARG LEPRIKON_TAG=latest
FROM leprikon/leprikon:$LEPRIKON_TAG

MAINTAINER Jakub Dorňák <jakub.dornak@misli.com>

# install other dependencies
COPY requirements.txt /app/requirements.txt
RUN pip install --no-cache-dir -r /app/requirements.txt

# copy files
COPY svcboskovice /app/svcboskovice

ENV SITE_MODULE=svcboskovice

# run this command at the end of any dockerfile based on this one
RUN leprikon collectstatic --no-input
