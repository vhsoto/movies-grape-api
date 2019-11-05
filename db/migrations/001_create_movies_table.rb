Sequel.migration do
  change do
      create_table(:movies, :ignore_index_errors=>true) do
        primary_key :id
        String :name, :size=>255, :null=>false
        String :description, :text=>true
        String :url_img, :size=>255
        DateTime :start_date, :null=>false
        DateTime :end_date, :null=>false
        
        index [:name], :name=>:sqlite_autoindex_movies_1, :unique=>true
      end
  end
end
