Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'articles#index'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }

  resources :users ,only: [:show] do
    resource :unsubscribes, only: [:edit, :destroy]
    resources :articles do
      resources :likes, only: [:create, :destroy]
    end
  end

  get 'toeic/about' => 'articles#about'

  get 'tags/:tag', to: 'articles#index', as: :tag

  #フォローとフォローを外すアクション(gem acts_as_follower)
  put '/follow/:user_id' => 'users#follow'
  put '/unfollow/:user_id' => 'users#unfollow'

  #フォロー・フォロワーの一覧ページ
  get '/follow_list/:user_id' => 'users_list', as: :follow
  get '/follower_list/:user_id' => 'users#follower_list',as: :follower
end
