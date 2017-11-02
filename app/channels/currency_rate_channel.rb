class CurrencyRateChannel < ApplicationCable::Channel
  def subscribed
    stream_from "currency_rate_channel_#{params[:currency_id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
