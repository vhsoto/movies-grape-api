class Reservation < Sequel::Model
  many_to_one :movie
end