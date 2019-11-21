describe Movies::CreateService do

  describe "should create the movie" do
    it 'should create a movie successfully' do
      input = {
          :name => "Mission Impossible 3",
          :description => "Mission Impossible 3",
          :image_url => "https://www.imdb.com/title/tt0317919/",
          :presented_on => "2019-11-26"

      }
      output = "{\"message\":\"Movie Created Successfully\",\"status\":\"created\",\"http_status\":201}"
      expect(Movies::CreateService.new(input).execute!).to eq(output)
    end

    it 'should fail to create a movie' do
      input = {
          :name => "",
          :description => "Fffff",
          :image_url => "Image url6",
          :presented_on => "2019-11-26"

      }
      output = "{\"message\":[\"name is not present\"],\"status\":\"error\",\"http_status\":400}"
      expect(Movies::CreateService.new(input).execute!).to eq(output)
    end
  end
end
