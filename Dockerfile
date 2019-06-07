FROM ruby:2.6

EXPOSE 3000
WORKDIR /app

RUN \
  apt-get update -qq && \
  apt-get install -y --no-install-recommends \
  nodejs \
  postgresql-client

COPY docker-entry.sh .

ENTRYPOINT ["/app/docker-entry.sh"]
CMD ["rails", "server", "-b", "0.0.0.0"]
