require 'sequel'
require 'sequel/extensions/migration'

Sequel.migration do
  up do
    create_table(:reservations) do
      primary_key :id
      String :username
      DateTime :reserved_on
      Integer :no_of_seats
      foreign_key :movie_id, :movies
      Timestamp :created_at, null: false
      Timestamp :updated_at
    end
  end

  down do
    drop_table(:reservations)
  end
end
