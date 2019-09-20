class LikesController < ApplicationController
    def create
        @user = current_user
        @like = current_user.likes.create(article_id: params[:article_id])
        @article = Article.find(params[:article_id])
    end

    def destroy
        @user = current_user
        @like = Like.find_by(article_id: params[:article_id], user_id: current_user.id)
        @article = Article.find(params[:article_id])
        @like.delete
    end
end