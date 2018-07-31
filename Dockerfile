FROM alpine
MAINTAINER jogendra Kumar <jogendra.jangid@gmail.com>

RUN apk -U add python py2-pip

RUN pip install elasticsearch-curator

COPY config/* /etc/curator/
COPY run-curator /usr/bin/

ENTRYPOINT ["/usr/bin/run-curator"]
