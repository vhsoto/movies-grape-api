# frozen_string_literal: true
ruby '2.5.3'

source "https://rubygems.org"

git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }



gem "grape", ">= 1.1.0"
gem 'sequel', '~> 4.36'

group :production do
  gem 'pg', '~> 1.1', '>= 1.1.4'
  gem 'rake', '~> 11.2', '>= 11.2.2'
end
