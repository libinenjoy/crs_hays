RSpec.describe DateHelper do
  include DateHelper

  context "#format_date" do
    it 'should parse date to Y-m-d' do
      expect(format_date("2019-11-18")).to eq("2019-11-18")
    end

    it 'should parse datetime to Y-m-d' do
      expect(format_date("2019-11-18 12:00:00")).to eq("2019-11-18")
    end
  end

  context "#format_datetime" do
    it 'should parse date to Y-m-d H:M:S' do
      expect(format_datetime("2019-11-18")).to eq("2019-11-18 00:00:00")
    end

    it 'should parse datetime to Y-m-d H:M:S' do
      expect(format_datetime("2019-11-18 12:00:00")).to eq("2019-11-18 00:00:00")
    end
  end

  context "#format_start_datetime" do
    it 'should parse date to Y-m-d H:M:S' do
      expect(format_start_datetime("2019-11-18")).to eq("2019-11-18 00:00:00")
    end

  end

  context "#format_end_datetime" do
    it 'should parse datetime to Y-m-d H:M:S' do
      expect(format_end_datetime("2019-11-18 12:00:00")).to eq("2019-11-18 23:59:59")
    end
  end
end
