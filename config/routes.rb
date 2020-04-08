Rails.application.routes.draw do
  post '/signup', to: 'accounts#create'
  post '/signin', to: 'auth#signin'
end
