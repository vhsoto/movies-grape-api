# Movies-grape-api

## Getting Started

### Install bundler

gem install bundler

### Install all gems from Gemfile

bundle install

### Run server

rackup

### Execute test request

*http://localhost:9292/api/test*

JSON response: 

> {  
> "saludo": "Hola Mundo!"  
> }

### Run migrations

Rake db:migrate

### Create movie

> Replace 'MOVIE_NAME', 'MOVIE_DESCRIPTION', 'IMG_URL' and 'MM/DD/YYYY' in the command below with the correct data.

curl -X POST -H Content-Type:application/json [http://localhost:9292/api/movies/new](http://localhost:9292/api/movies/new) -d "{"name": "MOVIE_NAME", "description": "MOVIE_DESCRIPTION", "url_img": "IMG_URL", "start_date": "MM/DD/YYYY", "end_date": "MM/DD/YYYY" }"

### Get listing movie by date

> Replace 'DD/MM/YYYY' in the command below with a valid date.

curl -X GET -H Content-Type:application/json '[http://localhost:9292/api/movies/cinema_listing?fecha=DD/MM/YYYY](http://localhost:9292/api/movies/cinema_listing?fecha=DD/MM/AAAA)'

JSON response: 
[
  {
    "name": "Joker",
    "description": "In 1981, party clown and aspiring stand-up comedian Arthur Fleck lives with his mother, Penny, in Gotham City. Gotham is rife with crime and unemployment, leaving segments of the population disenfranchised and impoverished. Arthur suffers from a disorder that causes him to laugh at inappropriate times, and depends on social services for medication. After a gang attacks him in an alley, Arthur's co-worker, Randall, gives him a gun. Arthur invites his neighbor, single mother Sophie, to his stand-up comedy show, and they begin dating.",
    "img": "https://upload.wikimedia.org/wikipedia/en/e/e1/Joker_%282019_film%29_poster.jpg",
    "start": "2019-08-31 00:00:00 +0000",
    "end": "2019-10-20 00:00:00 +0000"
  }
]

### Create movie reservation

> Replace 'DNI_NUMBER', 'PERSON_NAME', 'EMAIL', 'CELLPHONE' and 'DD/MM/YYYY' in the command below to the right data

curl -X POST -H Content-Type:application/json [http://localhost:9292/api/movies/MOVIE_ID/reservations/new](http://localhost:9292/api/movies/MOVIE_ID/reservations/new) -d "{"dni": "DNI_NUMBER", "name": "PERSON_NAME", "email": "EMAIL", "cel": "CELLPHONE", "reservation_date": "DD/MM/YYYY"}"

### Get movie reservations

>Replace 'MOVIE_ID' in the following command with the correct id of the movie
>
curl -X GET -H Content-Type:application/json '[http://localhost:9292/api/movies/MOVIE_ID/reservations

See on Heroku [https://movies-grape-api.herokuapp.com/api/movies](https://movies-grape-api.herokuapp.com/api/movies)
