# This will guess the User class
FactoryBot.define do
  factory :movie do
    name { "Jungle Book" }
    description  { "Jungle Book" }
    image_url {"a"}
    presented_on {"2019-11-19"}
  end
end
