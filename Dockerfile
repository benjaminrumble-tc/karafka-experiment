FROM ruby:2.7.2

WORKDIR /app


COPY Gemfile* /app/
RUN bundle install

COPY . /app
ENTRYPOINT [ "bundle" ]
CMD [ "exec", "karafka", "server" ]