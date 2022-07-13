FROM ruby:3.0.0-buster

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
WORKDIR /zap_alert
COPY Gemfile /zap_alert/Gemfile
COPY Gemfile.lock /zap_alert/Gemfile.lock
RUN bundle install

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000
