require 'rails_helper'
RSpec.describe ArticlesController, type: :controller do
  describe "#index" do
    # 未ログインのユーザーの場合
    context "as a user not to login" do
      # indexアクションのレスポンスのステータスが「302（失敗）」であることを確認
      it "returns a 302 response" do
        get :index
        expect(response).to have_http_status "302"
      end

      # indexアクションを行うとサインインページに遷移することを確認
      it "redirects to the sign-in page" do
        get :index
        expect(response).to redirect_to "/users/sign_in"
      end
    end
  end