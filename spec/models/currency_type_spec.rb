# == Schema Information
#
# Table name: currency_types
#
#  id          :integer          not null, primary key
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  nominal     :integer
#  external_id :string
#  char_code   :string
#

require 'rails_helper'

RSpec.describe CurrencyType, type: :model do
  context "Invalid" do 
    it "CurrencyType.new()" do
      expect(CurrencyType.new().valid?).to eq(false)
    end
  end
  context "Valid" do
    it "CurrencyType.new(title: STRING)" do
      expect(CurrencyType.new(title: 'EUR').valid?).to eq(true)
    end
  end
end
