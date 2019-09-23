class ArticlesController < ApplicationController

  def index
    user = User.find(params[:user_id])
    @liked_articles = Liked_articles.page(params[:page]).per(5).order(id: "DESC")
  end

  def show
    @user = User.find(params[:user_id])
    @article = Article.find(params[:id])
    if user_signed_in? && current_user.id == @user.id
      @like = Like.find_by(user_id: current_user.id, article: params[:id])
    end
  end

  def new
    @user = User.find(params[:user_id])
    @article = Article.new
  end

  def edit
    @user = User.find(params[:user_id])
    @article = Article.find(params[:id])
  end

  def destroy
    @user = User.find(params[:user_id])
    article = Article.find(params[:id])
    if article.delete
      flash[:notice]= "記事を削除しました！"
      redirect_to user_path(@user)
    else
      flash[:alert]= "記事の削除に失敗しました"
      redirect_to user_path(@user)
    end
  end

  def update
    @user = User.find(params[:user_id])
    @article = Article.find(params[:id])
    if @article.update(article_params)
      flash[:notice]= "記事を更新しました！"
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def create
    user = User.find(params[:user_id])
    article = Article.new(article_params)
    article.user_id == current_user.id
    if article.save
    flash[:success]= '投稿ありがとうございます！'
    redirect_to user_path(user)
    else
      flash[:alert]= '投稿に失敗しました。入力内容をご確認ください。'
      redirect_to new_user_article_path(user)
    end
  end

  def about
  end

private

  def article_params
    params.require(:article).permit(:title, :body, :article_image, :part_list, :key_word_list)
  end

end