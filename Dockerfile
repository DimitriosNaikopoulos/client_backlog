FROM ruby:2.7.0

# Install yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install -y yarn

RUN gem install bundler

COPY . /my-app

WORKDIR /my-app

RUN bundle check || bundle install

RUN yarn install --ckeck-files

EXPOSE 3000 3000
