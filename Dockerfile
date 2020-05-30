FROM ruby:2.7

RUN apt-get update && apt-get install -qq -y --no-install-recommends \
      build-essential nodejs libpq-dev

RUN apt-get install libxslt-dev libxml2-dev zlib1g-dev -y

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update && apt-get install -y yarn


ENV INSTALL_PATH /chat

ENV BUNDLE_PATH /gems

RUN mkdir -p $INSTALL_PATH && \
    mkdir -p $BUNDLE_PATH


WORKDIR $INSTALL_PATH

COPY Gemfile ./ 

ENV BUNDLE_PATH /gems

COPY . .