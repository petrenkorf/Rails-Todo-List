Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: 'registrations', sessions: 'sessions'}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #
  root 'application#redirect_to_lists' 
  get '/lists', to: 'list#index'
  get '/lists/new', to: 'list#new'
  post '/lists/new', to: 'list#create'
  post '/lists/close', to: 'list#close'
  get '/lists/public', to: 'public_list#index'
  get '/lists/:id', to: 'list#show'

  get '/bookmarks', to: 'bookmark_list#index'
  post '/bookmarks/new', to: 'bookmark_list#new'
end
