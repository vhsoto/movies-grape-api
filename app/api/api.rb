require 'grape'
require 'sequel'

module Rest
  class API < Grape::API
    prefix :api
    format :json

    #test
    get '/test' do
      {
        saludo: "Hola Mundo!"
      }
    end

    resources "movies" do
      post 'new' do
        newMovie = Movie.insert({name: params[:name], description: params[:description], url_img: params[:url_img], start_date: params[:start_date], end_date: params[:end_date]})
      end  

      get do
        {
          movies: Movie.all.map{
            |m| {name: m.name, description: m.description, sd: m.start_date, ed: m.end_date}
          }
        }      
      end

      get 'cinema_listing' do        
        date = params['fecha']        
        @movies = Movie.all.map do |movie|
          d1 = movie.start_date
          d2 = movie.end_date
          if (d1..d2).include?(date.to_date)
            {              
              name: movie.name, 
              description: movie.description, 
              img: movie.url_img,
              start: movie.start_date, 
              end: movie.end_date
            }
          end
        end
      end

      post ':id/reservations/new' do
        @movie = Movie[params[:id]]
        d1 = @movie.start_date
        d2 = @movie.end_date
        if (d1..d2).include?(params[:reservation_date].to_date)
          @reservation = @movie.add_reservation(dni: params[:dni], name: params[:name], email: params[:email], cel: params[:cel], reservation_date: params[:reservation_date])
        else
          raise StandardError.new "La película no se encuentra disponible en esa fecha"
        end
      end

      get ':id/reservations' do
        @movie = Movie[params[:id]]
        {
          reservations: @movie.reservations.map{|r| {dni: r.dni, name: r.name, booking: r.reservation_date }}
        }
      end
    end

    mount Reservation
    mount Movie
  end
end

curl -X POST -H Content-Type:application/json https://movies-grape-api.herokuapp.com/api/movies/new -d 
"{\"name\": \"Joker\", 
  \"description\": \"In 1981, party clown and aspiring stand-up comedian Arthur Fleck 
  lives with his mother, Penny, in Gotham City. Gotham is rife with crime 
  and unemployment, leaving segments of the population disenfranchised and impoverished. 
  Arthur suffers from a disorder that causes him to laugh at inappropriate times, 
  and depends on social services for medication. After a gang attacks him in an alley, 
  Arthur\'s co-worker, Randall, gives him a gun. Arthur invites his neighbor, 
  single mother Sophie, to his stand-up comedy show, and they begin dating.\", 
\"url_img\": \"https://upload.wikimedia.org/wikipedia/en/e/e1/Joker_%282019_film%29_poster.jpg\", 
\"start_date\": \"31/08/2019\", 
\"end_date\": \"20/10/2019\"}"