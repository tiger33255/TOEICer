require 'rails_helper'
RSpec.describe ArticlesController, type: :controller do
describe "#destroy" do
    # 別ユーザーのTaskを削除しようとした場合
    context "if logged in user deletes another user" do
      # 各example(it〜end)の前に「@user」「other_user」「(other_userの)@task」を作成
      before do
        @user = create(:user)
        other_user = create(:user)
        @task = create(:task, owner: other_user)
      end

      # プロジェクトを削除できないこと
      it "does not delete thetask" do
        # @userとしてログインする
        sign_in @user
        # DELETEを@taskに対して送信し、Taskの数が変わらないことを確認
        expect {
          delete :destroy, params: { id: @task.id }
        }.to_not change(Task, :count)
      end

      # ルートページにリダイレクトすること
      it "redirects to the dashboard" do
        # @userとしてログインする
        sign_in @user
        # DELETEを@taskにして送信する
        delete :destroy, params: { id: @task.id }
        # ルートページに遷移することを確認
        expect(response).to redirect_to root_path
      end
    end

    # 未ログインのユーザーの場合
    context "as a user not to login" do
      # 各example(it〜end)の前に「@task」を作成
      before do
        @task = FactoryBot.create(:task)
      end

      # 302レスポンスを返すこと
      it "returns a 302 response" do
        # DELETEを@taskに対して送信する
        delete :destroy, params: { id: @task.id }
        # レスポンスのステータスが「302（失敗）」であることを確認
        expect(response).to have_http_status "302"
      end

      # サインイン画面にリダイレクトすること
      it "redirects to the sign-in page" do
        # DELETEを@taskに対して送信する
        delete :destroy, params: { id: @task.id }
        # サインインページに遷移することを確認
        expect(response).to redirect_to "/users/sign_in"
      end

      # プロジェクトを削除できないこと
      it "does not delete the task" do
        # DELETEを@taskに対して送信し、Taskの数が変わらないことを確認
        expect {
          delete :destroy, params: { id: @task.id }
        }.to_not change(Task, :count)
      end
    end
  end
end