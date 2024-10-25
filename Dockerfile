FROM ruby:latest

# install dependencies
RUN apt-get update && apt-get install -y build-essential

# cleanup the apt cache
RUN apt-get autoremove -yq && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# use /app as our working directory
WORKDIR /app

# copy Gemfile into the container
COPY Gemfile .
COPY Gemfile.lock .

# Install the gems  (re-run `docker-compose build` when the Gemfile is changed)
RUN bundle

EXPOSE 4000

