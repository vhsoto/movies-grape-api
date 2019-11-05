require 'sequel'

Sequel.extension :blank
DB = Sequel.connect('postgres://db/movies_development.db')


