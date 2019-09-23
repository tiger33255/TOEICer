class UsersController < ApplicationController
    def index
        @all_ranks = Article.find(Like.group(:article_id).order('count(article_id) desc').limit(9).pluck(:article_id))
        @new_articles = Article.all.order(created_at: :desc).limit(9)
    if params[:tag]
        @search_articles = Article.tagged_with(params[:tag])
        else
        @search_articles = Article.all
        end
        @search_articles = @search_articles.order(created_at: :desc).page(params[:page])
    end

    def show
        @user = User.find(params[:id])
        @articles = @user.articles.page(params[:page]).per(5).order(id: "DESC")
    end

    #このコントローラーはgem acts_as_follow のため作成
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
        params.require(:user).permit(:last_name, :first_name, :nickname, :toeic_score, :reading_score, :listening_score, :user_image, :word)
    end
end
