Rails.application.routes.draw do
  get 'admin_consoles/index'

  post 'user_token' => 'user_token#create'
  resources :admin_consoles
  scope '/api' do
    resources :products
    resources :designs
    resources :categories
    resources :campaigns
    resources :users
    resources :orders
    post '/login', to: 'users#login'
    get '/logout', to: 'users#logout'
  end
end
