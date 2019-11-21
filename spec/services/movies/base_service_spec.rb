describe Movies::BaseService do

  describe "Should initialize the class" do
    it 'should initialize the params' do
      input = {name: "Jacky"}
      expect(Movies::BaseService.new(input).params).to eq(input)
    end
  end
end
