describe Movies::ListService do
  context "#execute!" do
    before(:all) do
      2.times do
        build(:movie, presented_on: '2019-11-22').save
      end
    end

    it 'should list 2 movies presenting on friday' do
      params = {presented_day: 'friday'}
      movies = Movies::ListService.new(params).execute!
      expect(JSON.parse(movies).count).to eq(2)
    end

    it 'should not list movies presenting on sunday' do
      params = {presented_day: 'sunday'}
      movies = Movies::ListService.new(params).execute!
      expect(JSON.parse(movies)).to eq("No records found!")
    end
  end
end
