class ApiController < ApplicationController
  include ApiHelper
  def current_rate
    render json: currency_current_rate(params[:ids])
  end

  def currency_rates
    render json: currencies_and_rates_for_100_days
  end
end
