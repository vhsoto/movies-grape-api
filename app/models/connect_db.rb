require 'sequel'

Sequel.extension :blank
DB = Sequel.connect('ENV[“DATABASE_URL”]')


