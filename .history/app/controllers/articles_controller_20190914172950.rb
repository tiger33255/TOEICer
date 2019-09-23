class ArticlesController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  def destroy
  end

  def update
  end

  def create
    article = Article.new(article_params)
    article.user_id = current_user.id
    if article.save
    flash[:success]= '投稿ありがとうございます！'
    redirect_to articles_path
    else
      flash[:alert]= '投稿に失敗しました。入力内容をご確認ください。'
      redirect_to new_aricle_path
    end
  end


  def about
  end
end

private

  def article_params
    params.require(:article).permit(:title, :body, :article_image_id)
  end

end