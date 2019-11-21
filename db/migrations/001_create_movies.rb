require 'sequel'
require 'sequel/extensions/migration'

Sequel.migration do
  up do
    create_table(:movies) do
      primary_key :id
      String :name
      Text :description
      String :image_url
      DateTime :presented_on
      Timestamp :created_at, null: false
      Timestamp :updated_at
    end
  end

  down do
    drop_table(:movies)
  end
end
