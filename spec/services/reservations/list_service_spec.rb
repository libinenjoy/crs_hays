describe Reservations::ListService do
  context "#execute!" do
    before(:each) do
      @movie_1 = build(:movie, name: "Iron Man", presented_on: "2019-11-20").save
      @movie_2 = build(:movie, name: "Black Panther", presented_on: "2019-11-21").save
      build(:reservation, reserved_on: @movie_1.presented_on, movie_id: @movie_1.id).save
      build(:reservation, username: "John Snow",reserved_on: @movie_1.presented_on, movie_id: @movie_1.id).save
      build(:reservation, reserved_on: @movie_2.presented_on, movie_id: @movie_2.id).save
    end

    it 'should list 2 movies presenting on friday' do
      params = {start_date: @movie_1.presented_on, end_date: @movie_2.presented_on}
      movies = Reservations::ListService.new(params).execute!

      expect(JSON.parse(movies).count).not_to eq(0)
    end
  end
end
