Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'articles#index'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }

  namespace :users do
    get '' => 'accunts#index'
    resource :unsubscribes, only: [:edit, :destroy]

    resources :users, only: [] do
      member do
        get 'follow'
      end

      member do
        get 'follower'
      end
    end
  end
  resources :article

  get 'about', action: :about, controller: 'article'

  end

end
