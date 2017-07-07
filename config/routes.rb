Rails.application.routes.draw do
  resources :items
  post 'auth/login', to: 'authentication#authenticate'
end
