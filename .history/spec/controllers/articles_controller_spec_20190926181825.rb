require 'rails_helper'
RSpec.describe UsersController, type: :controller do
  describe "#show" do
    # 別ユーザーのTaskを参照しようとした場合
    context "if logged in user shows another user" do
      before do
        # 各example(it〜end)の前に「@user」「other_user」「(other_userの)@task」を作成
        @user = User.create
        other_user = User.create
        @article = Article.create(article: @article, owner: other_user)
      end

      # ルートにリダイレクトすること
      it "redirects to the dashboard" do
        # 「@user」としてログイン
        sign_in @user
        # @userのidを渡して、other_userの@taskのshowページにアクセスする
        get :show, params: { id: @article.id }
        # ルートページに遷移することを確認
        expect(response).to redirect_to root_path
      end
    end
  end
end