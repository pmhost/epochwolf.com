#!/bin/bash --login

# Load the right ruby
source .rvmrc

# If bundler isn't installed, install it. 
which bundle || gem install bundle

# Install missing dependencies. 
bundle check || bundle install 

# Finally, start the server.
bundle exec middleman build
