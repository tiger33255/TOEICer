Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'article#index'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
  }

  namespace :users do
    get '' =>'accunts#index'
    resource :unsubscribes. only: [:edit, :destroy]
  end






end
