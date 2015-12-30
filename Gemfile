# REVIEW reccommended gems? How many of these do we need?
# resource for knowing the best ones I should be using?

# REVIEW verify I have RVM properly installed/working
# REVIEW switch to/using gemsets (make sure it is working)
source 'https://rubygems.org'

 # Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
 gem 'rails', '4.2.5'

 # REVIEW (future reference) purpose/usage for gemfile groups?
 group :production do
   gem 'pg'
 end

 group :development do
  #  REVIEW will this cause problems with heroku again?
  #  bundle install output shows this is getting installed
  #  (ignored when deployed to heroku?)
   gem 'sqlite3'
 end

 group :development, :test do
  #  REVIEW why specify this specific version?
   gem 'rspec-rails', '~> 3.0'
 end



 # Use SCSS for stylesheets
 gem 'sass-rails', '~> 5.0'
 # Use Uglifier as compressor for JavaScript assets
 gem 'uglifier', '>= 1.3.0'
 # Use CoffeeScript for .coffee assets and views
 gem 'coffee-rails', '~> 4.1.0'
 # Use jquery as the JavaScript library
 gem 'jquery-rails'
 # Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
 gem 'turbolinks'

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
# Gems added by GPC

gem 'devise'

# TODO add Bootstrap (after devise install)
