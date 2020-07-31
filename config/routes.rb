Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #
  root 'list#index' 
  get '/lists', to: 'list#index'
  get '/lists/new', to: 'list#new'
end
