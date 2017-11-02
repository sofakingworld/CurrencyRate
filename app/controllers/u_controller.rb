class UController < ApplicationController
  include ApiHelper
  def index
    @rate_Info = currencies_and_rates_for_100_days
  end
end
