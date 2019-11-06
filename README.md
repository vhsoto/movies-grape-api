# Movies-grape-api

## Getting Started

### Install bundler

gem install bundler


### Install all gems from Gemfile

bundle install


### Run server

rackup


### Execute test request

> http://localhost:9292/api/test

JSON response: 
{
  "saludo": "Hola Mundo!"
}


### Run migrations

Root project:
> Sequel currently has adapters for ADO, Amalgalite, IBM_DB, JDBC, MySQL, Mysql2, ODBC, Oracle, PostgreSQL, SQLAnywhere, SQLite3, and TinyTDS.
> Change (ADAPTER) of your preference, like(sqlite or postgres)

sequel -m db/migrations ADAPTER://db/movies_development.db


### Create movie
> change this (NOMBRE_PELICULA, DESCRIPCION_PELICULA, RUTA_IMAGEN y DD/MM/AAAA)

curl -X POST -H Content-Type:application/json http://localhost:9292/api/movies/new -d "{\"name\": \"NOMBRE_PELICULA\", \"description\": \"DESCRIPCION_PELICULA\", \"url_img\": \"RUTA_IMAGEN\", \"start_date\": \"DD/MM/AAAA\", \"end_date\": \"DD/MM/AAAA\" }"


### Get listing movie by date
> change this (DD/MM/AAAA)

curl -X GET -H Content-Type:application/json 'http://localhost:9292/api/movies/cinema_listing?fecha=DD/MM/AAAA'

JSON response: 
[
  {
    "name": "Avengers 1",
    "description": "erdyfghjnhbgvfcdxsxdfghjnnhbgvfcdfugihojpiohugyvftcdr",
    "img": "https://google.com",
    "start": "2019-11-01 00:00:00 -0500",
    "end": "2019-11-10 00:00:00 -0500"
  },
  {
    "name": "Avengers 4",
    "description": "xrdcytfuvygbuigvuyftcdrxdytfugiubgyuvftcdrtxcfvgyuib",
    "img": "https://google.com",
    "start": "2019-11-02 00:00:00 -0500",
    "end": "2019-11-15 00:00:00 -0500"
  },
  {
    "name": "Avengers End Game",
    "description": "xrdcytfuvygbuigvuyftcdrxdytfugiubgyuvftcdrtxcfvgyuib",
    "img": "https://google.com",
    "start": "2019-11-02 00:00:00 -0500",
    "end": "2019-11-15 00:00:00 -0500"
  }
]


### Create movie reservation
> change this (MOVIE_ID, NUMERO_DOCUMENTO, NOMBRE_QUIEN_RESERVA, CORREO, NUMERO_CELULAR y DD/MM/AAAA)

curl -X POST -H Content-Type:application/json http://localhost:9292/api/movies/MOVIE_ID/reservations/new -d "{\"dni\": \"NUMERO_DOCUMENTO\", \"name\": \"NOMBRE_QUIEN_RESERVA\", \"email\": \"CORREO\", \"cel\": \"NUMERO_CELULAR\", \"reservation_date\": \"DD/MM/AAAA\"}"

See on Heroku https://movies-grape-api.herokuapp.com/api/movies
