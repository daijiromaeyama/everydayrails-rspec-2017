source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 6.1', '>= 6.1.3.2'
gem 'sqlite3', '~> 1.4'
gem 'puma', '~> 5.3', '>= 5.3.2'
gem 'sass-rails', '~> 6.0'
gem 'uglifier', '~> 4.2'
gem 'coffee-rails', '~> 5.0'
gem 'turbolinks', '~> 5.2', '>= 5.2.1'
gem 'jbuilder', '~> 2.11', '>= 2.11.2'
gem 'webpacker', '~> 5.4'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara', '~> 3.35', '>= 3.35.3'
  gem 'selenium-webdriver'
end

group :development do
  gem 'web-console', '~> 4.1'
  gem 'listen', '~> 3.5', '>= 3.5.1'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0', '>= 2.0.1'
  gem 'faker', require: false # for sample data in development
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem 'bootstrap-sass'
gem 'jquery-rails'
gem 'devise'
gem 'paperclip', git: 'https://github.com/sd/paperclip', branch: 'remove-mimemagic'
gem 'geocoder'
