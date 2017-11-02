Rails.application.routes.draw do
  root to: 'u#index'
  devise_for :users
  
  
  # api
  get 'api/current_rate'
  get 'api/currency_rates'

  # def routes
  get 'u', to: 'u#index'
  get '/admin', to: 'admin#index'
  post 'admin/force', to: 'admin#force'
  
  # Serve websocket cable requests in-process 
  mount ActionCable.server => '/cable'

end
