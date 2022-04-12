# syntax=docker/dockerfile:1
FROM ruby:3.1.1
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

WORKDIR /app

COPY Gemfile* /app/

RUN bundle check || bundle install --jobs=4 --retry=3

COPY . ./
ENTRYPOINT ["./entrypoint.sh"]
EXPOSE 3001

# Configure the main process to run when running the image
CMD ["rails", "server", "-p", "3001", "-b", "0.0.0.0"]