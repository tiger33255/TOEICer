Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'articles#index'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }

  resources :users ,only: [:show] do
    resources :articles do
      resources :likes, only: [:create, :destroy]
    end
  end

  namespace :users do
    #フォローとフォローを外すアクション(gem acts_as_follower)
    put '/follow/:user_id' => 'accounts#follow'
    put '/unfollow/:user_id' => 'accounts#unfollow'

    #フォロー・フォロワーの一覧ページ
    get '/follow_list/:user_id' => 'accounts#follow_list', as: :follow
    get '/follower_list/:user_id' => 'accounts#follower_list',as: :follower

    #退会ページ
    resource :unsubscribes, only: [:edit, :destroy]
  end

  get 'toeic/about' => 'articles#about'

  get 'tags/:tag', to: 'articles#index', as: :tag

end
