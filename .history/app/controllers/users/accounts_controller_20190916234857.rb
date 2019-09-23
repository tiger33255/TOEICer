class Users::AccountsController < ApplicationController
    def index
        @user = current_user
        @articles = Article.all
    end
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

    #フォローしてる人の一覧ページ
    def follow_list
      @user = User.find(params[:user_id])
    end

    #フォロワーの一覧ページ
    def follower_list
      @user = User.find(params[:user_id])
    end

private

    def user_params
        params.require(:user).permit(:last_name, :first_name, :nickname, :toeic_score, :user_image)
    end

end
