FROM ruby:2.7.2

RUN apt-get update -qq && \
  apt-get install -y build-essential libpq-dev

RUN apt-get update && apt-get install -y curl apt-transport-https wget && \
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
  apt-get update && apt-get install -y yarn

RUN curl -sL https://deb.nodesource.com/setup_13.x | bash - && \
  apt-get install -y nodejs

RUN mkdir /app
RUN cd /app
RUN gem install bundler
COPY ./QA_FUNC/ /app
WORKDIR /app
EXPOSE 3000

CMD ["/bin/bash"]