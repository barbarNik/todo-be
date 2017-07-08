Rails.application.routes.draw do
  scope '/api' do
    resources :items
    post 'login', to: 'authentication#authenticate'
  end
end
