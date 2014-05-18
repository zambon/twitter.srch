source "https://rubygems.org"

ruby "2.0.0"

gem "rails",          "~> 3.2.18"

gem "sqlite3",        "~> 1.3.9"
gem "haml",           "~> 4.0.5"
gem "json",           "~> 1.8.1"
gem "twitter",        "~> 5.9.0"
gem "jquery-rails",   "~> 3.1.0"

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem "sass-rails",   "~> 3.2.3"
  gem "coffee-rails", "~> 3.2.1"

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem "therubyracer", :platforms => :ruby

  gem "uglifier",     ">= 1.0.3"
end

group :development do
  gem "unicorn",      "~> 4.8.3"
  gem "annotate",     "~> 2.6.3"

  gem "rspec-rails"
  if RUBY_PLATFORM =~ /darwin/
    gem "rb-fsevent", "~> 0.9.4"
    gem "growl",      "~> 1.0.3"
  end
end
