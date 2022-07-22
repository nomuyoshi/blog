FROM ruby:3.1.2-alpine
RUN apk update \
      && apk add --no-cache gcc make libc-dev g++ mariadb-dev tzdata nodejs~=16 yarn
WORKDIR /myapp
ENV RAILS_ENV=production
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
COPY package.json /myapp/package.json
COPY yarn.lock /myapp/yarn.lock

RUN bundle install --jobs=2 --without test development
RUN yarn install

COPY . /myapp
RUN NODE_ENV=production ./bin/webpack
RUN mkdir -p /myapp/tmp/pids
RUN mkdir -p /myapp/tmp/sockets
VOLUME /myapp/public
VOLUME /myapp/tmp
COPY ./docker/rails/entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
CMD ["bundle", "exec", "rails", "s", "-e", "production"]
