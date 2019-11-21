describe BaseService do

  describe "#error" do
    it 'should return an error json' do
      output = "{\"message\":\"this an error\",\"status\":\"error\",\"http_status\":400}"
      expect(BaseService.new.error("this an error", 400)).to eq(output)
    end
  end

  describe "#success" do
    it 'should return a success json' do
      output = "{\"message\":\"this a success\",\"status\":\"error\",\"http_status\":200}"
      expect(BaseService.new.error("this a success", 200)).to eq(output)
    end
  end

end
