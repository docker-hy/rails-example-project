FROM ruby:2.6.0
RUN apt-get update \
	&& apt-get install -y curl \
	&& curl -sL https://deb.nodesource.com/setup_10.x | bash \
	&& apt-get install -y nodejs
WORKDIR /usr/src/app
RUN gem install bundler
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .
RUN rails db:migrate
CMD ["rails", "s"]
