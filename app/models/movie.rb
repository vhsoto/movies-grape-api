class Movie < Sequel::Model
  one_to_many :reservations
end