Rails.application.routes.draw do
  devise_for :users

  resources :tasks

  get '/search_result', to: 'tasks#search'


  root to: 'tasks#index'
end
