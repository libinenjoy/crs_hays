require "sinatra/namespace"
class Routes < Sinatra::Application

  before do
    content_type 'application/json'
  end

  # Get Movies List
  # localhost:9393/movies?presented_day=wednesday
  get '/movies' do
    Movies::ListService.new(params).execute!
  end

  # Create Movie
  post "/movies" do
    Movies::CreateService.new(params).execute!
  end

  # Create reservations
  post "/reservations" do
    Reservations::CreateService.new(params).execute!
  end
  # Get reservations
  get "/reservations" do
    Reservations::ListService.new(params).execute!
  end

  not_found do
    "Please refer README.md for endpoint details!".to_json
  end

  private
  def params
    if request.env['REQUEST_METHOD'] == "GET"
      @params
    else
      JSON.parse(request.body.read, symbolize_names: true)
    end
  end
end
