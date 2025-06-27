FROM ruby:3.2.2

RUN apt-get update && apt-get install ca-certificates

RUN curl -sL https://deb.nodesource.com/setup_20.x | bash - && \
  apt-get update -qq && apt-get install -y build-essential nodejs yarn

WORKDIR /var/app
COPY . .

RUN bundle install -j4

ENTRYPOINT [ "./entrypoint.sh" ]
