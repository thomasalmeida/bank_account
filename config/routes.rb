Rails.application.routes.draw do
  post '/signup', to: 'accounts#create'
  post '/signin', to: 'auth#signin'

  get '/accounts/:account_id/balance', to: 'accounts#get_balance', as: 'balance'
  post '/transactions', to:'transactions#create'
end
