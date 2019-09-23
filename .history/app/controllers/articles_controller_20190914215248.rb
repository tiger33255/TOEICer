class ArticlesController < ApplicationController

  def index
  end

  def show
  end

  def new
    @article = Article.new
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
    article.save!
    flash[:success]= '投稿ありがとうございます！'
    redirect_to articles_path
  end

  def about
  end

private

  def article_params
    params.require(:article).permit(:title, :body, :article_image)
  end

end