# == Schema Information
#
# Table name: forced_rates
#
#  id               :integer          not null, primary key
#  currency_rate_id :integer
#  user_id          :integer
#  forced_till      :datetime
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

require 'rails_helper'

RSpec.describe ForcedRate, type: :model do
  context "Invalid" do 
    it "ForcedRate.new()" do
      expect(ForcedRate.new().valid?).to eq(false)
    end
    
    it "ForcedRate.new(user_id: 0)" do
      expect(ForcedRate.new(user_id: 0).valid?).to eq(false)
    end

    it "ForcedRate.new(currency_rate_id: 0)" do
      expect(ForcedRate.new(currency_rate_id:0).valid?).to eq(false)
    end

  end
  context "Valid" do
    it "ForcedRate.new(user_id: exists, currency_rate-id:exists, forced_till: datetime)" do
      expect(CurrencyType.new(title: 'EUR').valid?).to eq(true)
    end
  end
end
