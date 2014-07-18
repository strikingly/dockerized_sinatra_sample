# Dockerfile for dockerized_sinatra_sample

# Select base image
FROM strikingly/base:latest

# Install ruby, bundler
RUN /bin/bash -l -c "rvm install 2.0.0-p481"
RUN /bin/bash -l -c "gem install bundler --no-ri --no-rdoc"

# Add Gemfile first to possibly cache bundle install
ADD ./.ruby-version /tmp/.ruby-version
ADD ./Gemfile /tmp/Gemfile
ADD ./Gemfile.lock /tmp/Gemfile.lock

# Bundle install
WORKDIR /tmp
RUN /bin/bash -l -c "bundle install"

# Add configuration files in repository to filesystem
ADD config/docker/start_web /usr/bin/strikingly/dockerized_sinatra_sample/start_web
RUN chmod +x /usr/bin/strikingly/dockerized_sinatra_sample/start_web

# Add rails project to project directory
ADD ./ /strikingly/dockerized_sinatra_sample

# set WORKDIR
WORKDIR /strikingly/dockerized_sinatra_sample

# Remove git stuff to reduce image size
RUN rm -rf .git
