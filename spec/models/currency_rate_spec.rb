# == Schema Information
#
# Table name: currency_rates
#
#  id                      :integer          not null, primary key
#  first_currency_type_id  :integer
#  second_currency_type_id :integer
#  first_value             :decimal(, )
#  second_value            :decimal(, )
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#

require 'rails_helper'

RSpec.describe CurrencyRate, type: :model do
  before(:all) do
    CurrencyType.create(title: 'RUB')
    CurrencyType.create(title: 'USD')
  end

  context "Invalid" do 

    it "CurrencyRate.new()" do
      rate = CurrencyRate.new()
      expect(rate.valid?).to eq(false)
    end
    
    it "CurrencyRate.new(first_currency_type_id: not exist)" do
      rate = CurrencyRate.new(first_currency_type_id: 0)
      expect(rate.valid?).to eq(false)
    end

    it "CurrencyRate.new(second_currency_type_id: not exist)" do
      rate = CurrencyRate.new(second_currency_type_id: 0)
      expect(rate.valid?).to eq(false)
    end   

    it "CurrencyRate.new(...,first_value: empty, second_value: empty)" do
      rate = CurrencyRate.new(second_currency_type_id: 1, first_currency_type_id: 1)
      expect(rate.valid?).to eq(false)
    end

    it "CurrencyRate.new(first_currency_type_id == second_currency_type_id) " do
      rate = CurrencyRate.new(second_currency_type_id: 1, 
                              first_currency_type_id: 1,
                              first_value: 30,
                              second_value: 40)
      expect(rate.valid?).to eq(false)                          
    end
  end
  context "Valid" do 
    it "CurrencyRate.new(currency_types exists,values given)" do
      rate = CurrencyRate.new(second_currency_type_id: 1, 
      first_currency_type_id: 2,
      first_value: 1,
      second_value: 50)
      expect(rate.valid?).to eq(true)  
    end    
  end
end
