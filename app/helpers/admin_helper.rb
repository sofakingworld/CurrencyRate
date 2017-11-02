require 'rufus-scheduler'


module AdminHelper
    def create_currency_rate(first_currency, q_params)
        CurrencyRate.new(first_currency_type_id: first_currency.id,
            second_value: first_currency.nominal,
            second_currency_type_id: q_params[:second_currency_type_id],
            first_value: q_params[:rate_value]
        )
    end

    # cur_type_id - идентификатор курса, на изменение которого подписаны пользователи
    # next_call_dt - время, когда отправляется сообщение о завершении форсированного курса    
    def broadcast(cur_type_id, next_call_dt)
        ActionCable.server.broadcast("currency_rate_channel_#{cur_type_id}", currency_current_rate(cur_type_id))
        scheduler = Rufus::Scheduler.new
        # планировщик, разошлет сообщение, когда форсированный курс закончится
        scheduler.at next_call_dt do |job|
          ActionCable.server.broadcast("currency_rate_channel_#{cur_type_id}", currency_current_rate(cur_type_id))
          job.kill
        end
    end
end