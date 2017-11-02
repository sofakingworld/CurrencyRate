# App.currency_rate = App.cable.subscriptions.create "CurrencyRateChannel",  
#   connected: ->
#     console.log('CurrencyRateChannel connected')
#     # Called when the subscription is ready for use on the server

#   disconnected: ->
#     console.log('CurrencyRateChannel disconnected')
#     # Called when the subscription has been terminated by the server

#   received:  (data) ->
#     console.log('CurrencyRateChannel',data)
#     # Called when there's incoming data on the websocket for this channel
