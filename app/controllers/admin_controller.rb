require 'rufus-scheduler'

class AdminController < ApplicationController
  before_action :authenticate_user!
  include ApiHelper
  include AdminHelper
 
  def index
    fr = current_user.ForcedRates.last
    cr = fr.currency_rate if fr
    # Прошлый ввод данных
    @prev = {
      valid_till_date: fr ? fr.forced_till.strftime("%d %B, %Y") : nil,
      valid_till_time: fr ? fr.forced_till.strftime("%H:%M") : nil,
      rate: cr ? cr.first_value : nil,
      currency: cr ? cr.second_currency_type_id : nil
    }
  end


  # Обработка формы ввода форсированного курса
  def force 
    begin
      valid_till = Time.parse(params[:date]+' '+params[:time])
      
      cr = create_currency_rate(CurrencyType.find_by(char_code: 'RUB'), force_params)

      if cr.save then
        ForcedRate.create(currency_rate_id: cr.id, 
          forced_till: valid_till,
          user_id: current_user.id
        )
        flash[:params] = 'Rate succesfully forced'
        # ожидаем смены курса 1 секунду, отсылаем информацию
        broadcast(params[:second_currency_type_id], valid_till+1) 
      else 
        flash[:params] = cr.errors
      end
    rescue Exception => e  
      flash[:params] = e.inspect 
    end
    redirect_to admin_path
  end 
  
  private 
    def force_params 
      params.permit(:second_currency_type_id, :rate_value, :date, :time)
    end


end
