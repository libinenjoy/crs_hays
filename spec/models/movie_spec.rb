require 'spec_helper'
RSpec.describe Movie, type: :model do
  describe "associations" do
    it { is_expected.to have_one_to_many :reservations }
  end

  describe "validations" do
    it { is_expected.to validate_presence :name }
    it { is_expected.to validate_presence :image_url }
    it { is_expected.to validate_presence :presented_on }
  end
end
