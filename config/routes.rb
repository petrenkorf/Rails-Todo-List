Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: 'registrations', sessions: 'sessions'}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #
  root 'application#redirect_to_lists' 
  get '/lists', to: 'list#index'
  get '/lists/new', to: 'list#new'
  post '/lists/new', to: 'list#create'
  get '/lists/public', to: 'public_list#index'
end
