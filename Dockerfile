FROM ruby:2.7

RUN apt-get update && apt-get install -qq -y --no-install-recommends \
      build-essential nodejs libpq-dev

RUN apt-get install libxslt-dev libxml2-dev zlib1g-dev -y

ENV INSTALL_PATH /chat

ENV BUNDLE_PATH /gems

RUN mkdir -p $INSTALL_PATH && \
    mkdir -p $BUNDLE_PATH


WORKDIR $INSTALL_PATH

COPY Gemfile ./ 

ENV BUNDLE_PATH /gems

COPY . .