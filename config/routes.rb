Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#index'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }

  resources :users ,only: [:show, :index] do
    resource :unsubscribes, only: [:edit, :destroy]
    resources :articles do
      resources :likes, only: [:create, :destroy]
    end
  end

  get 'toeicer/about' => 'articles#about'

  get 'tags/:tag', to: 'users#index', as: :tag

  #フォローとフォローを外すアクション(gem acts_as_follower)
  put 'users/follow/:user_id' => 'users#follow'
  put 'users/unfollow/:user_id' => 'users#unfollow'

  #フォロー・フォロワーの一覧ページ
  get 'users/follow_list/:user_id' => 'users#follow_list', as: :follow
  get 'users/follower_list/:user_id' => 'users#follower_list',as: :follower
end
