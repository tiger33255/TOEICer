class ArticlesController < ApplicationController

  def index
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def destroy
    @article = Article.find(params[:id])
    if @article.destroy!
      flash[:notice]= "記事を削除しました！"
      redirect_to users_path
    else
      flash[:alert]= "記事の削除に失敗しました"
      redirect_to users_path
    end
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      flash[:notice]= "記事を更新しました！"
      redirect_to users_path
    else
      render :edit
    end
  end

  def create
    article = Article.new(article_params)
    article.user_id = current_user.id
    if article.save
    flash[:success]= '投稿ありがとうございます！'
    redirect_to articles_path
    else
      flash[:alert]= '投稿に失敗しました。入力内容をご確認ください。'
      redirect_to new_article_path
    end
  end

  def about
  end

private

  def article_params
    params.require(:article).permit(:title, :body, :article_image, :part_list, :key_word_list)
  end

end