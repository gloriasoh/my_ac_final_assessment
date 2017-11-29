Rails.application.routes.draw do

  root 'notes#index'

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }


  resources :notes
  resources :followings, only: [:create, :destroy]
  # resources :likes, only: [:create, :destroy,
  post 'like/:id', to: 'notes#like', as: 'like'
  delete 'unlike/:id', to: 'notes#unlike', as: 'unlike'

end
