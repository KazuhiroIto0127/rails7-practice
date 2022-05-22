FROM ruby:3.1.2

ENV ROOT="/app"
ENV LANG=C.UTF-8
ENV TZ=Asia/Tokyo
ENV BUNDLER_VERSION=2.3.10

WORKDIR ${ROOT}

COPY Gemfile Gemfile.lock ${ROOT}
RUN gem install bundler -v ${BUNDLER_VERSION} && \
    bundle install
COPY . ${ROOT}

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
