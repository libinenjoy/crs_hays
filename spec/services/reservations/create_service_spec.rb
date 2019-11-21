describe Reservations::CreateService do

  describe "should create the movie" do
    before(:each) do
      @movie = build(:movie, name: "Avengers")
      @movie.save
    end
    it 'should create a movie successfully' do
      input = {
          :username => "James",
          :reserved_on => @movie.presented_on,
          :no_of_seats => "2",
          :movie_id => @movie.id
      }
      output = "{\"message\":\"Reservation Created Successfully\",\"status\":\"created\",\"http_status\":201}"
      expect(Reservations::CreateService.new(input).execute!).to eq(output)
    end

    it 'should fail to create a movie' do
      input = {
          :username => "",
          :reserved_on => @movie.presented_on,
          :no_of_seats => "2",
          :movie_id => @movie.id
      }
      output = "{\"message\":[\"username is not present\"],\"status\":\"error\",\"http_status\":400}"
      expect(Reservations::CreateService.new(input).execute!).to eq(output)
    end
  end
end
