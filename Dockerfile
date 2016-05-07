FROM centos:7

MAINTAINER Ted Wood <ted@xy0.org>

ENV REFRESHED_AT 2016-04-07

RUN yum update -y && yum install -y \
        curl \
        gcc \
        git \
        make \
        rpm-build \
        ruby \
        ruby-devel \
        tar \
        zlib


RUN echo "gem: --no-ri --no-rdoc" >/etc/gemrc
#RUN gem install fpm -v 1.5.0
#RUN gem install fpm-cookery -v 0.31.0
RUN gem install fpm
RUN gem install fpm-cookery

VOLUME /data
WORKDIR /data

CMD ["fpm-cook", "package", "--debug", "--tmp-root", "/tmp", "recipe.rb"]
