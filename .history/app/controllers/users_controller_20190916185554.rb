class UsersController < ApplicationController
    #フォローする
    def follow
        @user = User.find(params[:user_id])
        current_user.follow(@user)
        redirect_to user_path(@user)
    end

    #フォローを外す
    def unfollow
        @user = User.find(params[:user_id])
        current_user.stop_following(@user)
        redirect_to user_path(@user)
    end


    def follow_list
      @user = User.find(params[:user_id])
    end
  #フォローしてる人の一覧ページ

    def follower_list
      @user = User.find(params[:user_id])
    end
  #フォロワーの一覧ページ
end
