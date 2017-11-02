require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the ApiHelper. For example:
#
# describe ApiHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe ApiHelper, type: :helper do
  it "currencies_and_rates_for_100_days - return hash" do 
    expect(helper.currencies_and_rates_for_100_days.class).to eq(Hash)
  end

  it "currencies_and_rates_for_100_days - keys currencies and rates" do 
    expect(helper.currencies_and_rates_for_100_days.keys).to eq([:currencies, :rates])
  end

  it "currency_current_rate(12) - array class" do
    expect(helper.currency_current_rate([12]).class).to eq(Array)
  end

  it "currency_current_rate(12) - keys valute and last_rate class" do
    expect(helper.currency_current_rate([12]).last.keys).to eq([:valute, :last_rate])
  end
end
