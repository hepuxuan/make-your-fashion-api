Rails.application.routes.draw do
  post 'user_token' => 'user_token#create'
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
