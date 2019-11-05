require 'sequel'

Sequel.extension :blank
DB = Sequel.connect('sqlite://db/movies_development.sqlite3')


