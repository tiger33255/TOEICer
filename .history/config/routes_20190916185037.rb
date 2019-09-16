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
  end

  resources :articles

  get 'toeic/about' => 'articles#about'

  get 'tags/:tag', to: 'articles#index', as: :tag

end
