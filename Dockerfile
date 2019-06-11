FROM ruby:2.6.3

EXPOSE 3000
WORKDIR /app

RUN \
  apt-get update -qq && \
  apt-get install -y --no-install-recommends \
  nodejs \
  postgresql-client

ENV BUNDLE_PATH=/bundle \
  BUNDLE_BIN=/bundle/bin \
  GEM_HOME=/bundle
ENV PATH="${BUNDLE_BIN}:${PATH}"

COPY docker-entry.sh .

ENTRYPOINT ["/app/docker-entry.sh"]
CMD ["rails", "server", "-b", "0.0.0.0"]
