Sequel.migration do
  change do
      create_table(:reservations, :ignore_index_errors=>true) do
        primary_key :id
        String :dni, unique: true, :null=>false
        String :name, :size=>255, :null=>false
        String :email
        String :cel
        DateTime :reservation_date, :null=>false
        foreign_key :movie_id, :movies
      end
  end
end
