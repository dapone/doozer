DeviseExample::Application.routes.draw do

  devise_for :users

  get '/token' => 'home#token', as: :token

  resources :home, only: :index
 
  resources :lists do
    resources :items
  end
 

  root 'home#index'

end
