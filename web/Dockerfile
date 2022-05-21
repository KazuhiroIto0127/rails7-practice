FROM ruby:3.1.1-alpine as builder

ENV ROOT="/app"
ENV LANG=C.UTF-8
ENV TZ=Asia/Tokyo

WORKDIR ${ROOT}

COPY Gemfile Gemfile.lock ${ROOT}

RUN apk add \
    alpine-sdk \
    build-base \
    sqlite-dev \
    mysql-client \
    mysql-dev \
    tzdata \
    git \
    gcompat

RUN gem install bundler
RUN bundle install


FROM ruby:3.1.1-alpine

ENV ROOT="/app"
ENV LANG=C.UTF-8
ENV TZ=Asia/Tokyo

RUN apk update && \
    apk add \
        mysql-dev \
        tzdata \
        bash \
        gcompat

WORKDIR ${ROOT}

COPY --from=builder /usr/local/bundle /usr/local/bundle
COPY . ${ROOT}
COPY entrypoint.sh /usr/bin/

RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
