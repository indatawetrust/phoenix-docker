FROM ubuntu:latest

RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN apt-get update && apt-get upgrade -y && apt-get install -y curl wget git make
RUN wget http://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb \
 && dpkg -i erlang-solutions_1.0_all.deb \
 && apt-get update

RUN apt-get install -y elixir erlang-dev erlang-parsetools && rm erlang-solutions_1.0_all.deb

ENV PHOENIX_VERSION 1.1.4

RUN mix archive.install --force https://github.com/phoenixframework/archives/raw/master/phoenix_new-$PHOENIX_VERSION.ez

RUN curl -sL https://deb.nodesource.com/setup_5.x | bash -

RUN apt-get install -y nodejs

WORKDIR /

RUN mix phoenix.new blog

WORKDIR blog

RUN mix local.hex --force
RUN mix local.rebar
RUN mix deps.get

RUN npm install && npm install --save-dev babel-cli babel-preset-es2015

RUN echo '{ "presets": ["es2015"] }' > .babelrc

EXPOSE 4000
