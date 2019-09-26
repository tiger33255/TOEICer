require 'rails_helper'
RSpec.describe UsersController, type: :controller do
    describe '新規投稿ページ' do
      context "新規投稿ページが正しく表示される" do
        before do
          get :index
        end
        it 'リクエストは200 OKとなること' do
          expect(response.status).to eq 200
        end
      end
    end

    context "as an authenticated user" do

        # 各example(it〜end)の前に「@user」を作成
        before do
          @user = FactoryBot.create(:user)
        end

        # 正常にレスポンスを返すこと
        it "responds successfully" do
          # 「@user」としてログイン
          sign_in @user
          # indexアクションを行うと、レスポンスがあることを確認
          get :index expect(response).to be_successful
        end

        # 200レスポンスを返すこと
        it "returns a 200 response" do
          # 「@user」としてログイン
          sign_in @user
          # indexアクションを行うと、レスポンスのステータスが「200（成功）」であることを確認
          get :index expect(response).to have_http_status "200"
        end
      end
end