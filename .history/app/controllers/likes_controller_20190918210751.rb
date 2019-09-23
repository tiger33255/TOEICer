class LikesController < ApplicationController
    def create
        @like = current_user.likes.create(article_id: params[:article_id])
        render status: 200, json: { message: 'OK' }
    end

    def destroy
        @like = Like.find_by(article_id: params[:article_id], user_id: current_user.id)
        @like.delete
    end
end
