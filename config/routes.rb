Rails.application.routes.draw do

  root 'notes#index'

  devise_for :users

  resources :notes
  resources :followings, only: [:create, :destroy]

end
