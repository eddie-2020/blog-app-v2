source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.1'

gem 'rails', '~> 7.0.3'

gem 'sprockets-rails'

gem 'pg', '~> 1.1'

gem 'puma'

gem 'importmap-rails'

gem 'turbo-rails'

gem 'stimulus-rails'

gem 'jbuilder'

gem 'cancancan'

gem 'cssbundling-rails'

gem 'devise'

gem 'tzinfo-data'

gem 'bootsnap', require: false

gem 'rubocop', '>= 1.0', '< 2.0'

group :development, :test do
  gem 'capybara'
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'rspec-rails'
  gem 'webdrivers'
end

group :development do
  gem 'web-console'
end

group :test do
  gem 'selenium-webdriver'
end
