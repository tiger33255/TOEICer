require 'rails_helper'
RSpec.describe ArticlesController, type: :controller do
describe "#destroy" do
    # 別ユーザーのTaskを削除しようとした場合
    context "if logged in user deletes another user" do
      # 各example(it〜end)の前に「@user」「other_user」「(other_userの)@task」を作成
      before do
        @user = FactoryBot.create(:user)
        other_user = FactoryBot.create(:other_user)
        @article = FactoryBot.create(:article, user_id: other_user.id)
      end

      # プロジェクトを削除できないこと
      it "does not delete thetask" do
        # @userとしてログインする
        sign_in @user
        # DELETEを@taskに対して送信し、Taskの数が変わらないことを確認
        expect {
          delete :destroy, params: { id: @article.id, user_id: @user.id }
        }
      end

    # 未ログインのユーザーの場合
    context "as a user not to login" do
      # 各example(it〜end)の前に「@task」を作成
      before do
        @article = FactoryBot.create(:article, user_id: @user.id)
      end

      # 302レスポンスを返すこと
      it "returns a 302 response" do
        # DELETEを@taskに対して送信する
        delete :destroy, params: { id: @article.id, user_id: @user.id }
        # レスポンスのステータスが「302（失敗）」であることを確認
        expect(response).to have_http_status "302"
      end

      # サインイン画面にリダイレクトすること
      it "redirects to the sign-in page" do
        # DELETEを@taskに対して送信する
        delete :destroy, params: { id: @article.id, user_id: @user.id }
        # サインインページに遷移することを確認
        expect(response).to redirect_to users_path
      end

      # プロジェクトを削除できないこと
      it "does not delete the task" do
        # DELETEを@taskに対して送信し、Taskの数が変わらないことを確認
        expect {
          delete :destroy, params: { id: @article.id, user_id: @user.id }
        }
      end
    end
    end
  end
end