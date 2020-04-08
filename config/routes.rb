Rails.application.routes.draw do
  post '/signup', to: 'accounts#create'
end
