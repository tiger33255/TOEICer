Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'articles#index'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }

  namespace :users do
    get '' => 'accounts#index'
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
  resources :articles

  get 'toeic/about' => 'articles#about'

  get 'tags/:tag', to: 'posts#index', as: :tag

end
