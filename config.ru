$:.unshift "./app"
require 'models/connect_db'
require 'models/movie'
require 'models/reservation'
require 'api/api'

run Rest::API