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

    #フォローとフォローを外すアクション(gem acts_as_follower)
    put 'users/follow/:user_id' => 'accounts#follow'
    put 'users/unfollow/:user_id' => 'accounts#unfollow'

    #フォロー・フォロワーの一覧ページ
    get '/follow_list/:user_id' => 'accounts#follow_list'
    get '/follower_list/:user_id' => 'accounts#follower_list'
    #退会ページ
    resource :unsubscribes, only: [:edit, :destroy]
  end

  get 'toeic/about' => 'articles#about'

  get 'tags/:tag', to: 'articles#index', as: :tag

end
