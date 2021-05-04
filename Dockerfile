FROM python:3.8-slim

LABEL name="politikus" version="1.0" \
    description="plone based CMS for investigative journalists and researchers" 

ENV LANG C.UTF-8
ENV LANGUAGE C.UTF-8
ENV LC_ALL C.UTF-8

RUN apt-get update -y && \
    apt-get install -y --no-install-recommends \
	apt-utils locales git-core gcc g++ netcat libxml2-dev \
    libxslt-dev libz-dev python3-dev libpcre2-dev \
    libpcre3-dev build-essential poppler-utils graphicsmagick \
    tesseract-ocr libreoffice qpdf \
    && rm -rf /var/lib/apt/lists/*


RUN useradd --system -m -d /plone plone

RUN mkdir -p /data/filestorage /data/blobstorage \
    && chown -R plone /data

WORKDIR /plone/

COPY ./requirements.txt /plone/requirements.txt
COPY ./buildout.cfg /plone/buildout.cfg

RUN pip install -r /plone/requirements.txt

RUN buildout -c /plone/buildout.cfg \
    && chown -R plone /plone /data

USER plone

EXPOSE 8080

VOLUME /data/

CMD [ "/plone/bin/instance", "start" ]