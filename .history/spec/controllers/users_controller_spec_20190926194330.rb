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
    # ログイン済みのユーザーの場合
    context "as an authorized user" do
        # 各example(it〜end)の前に「@user」「(@userの)@task」を作成
        before do
          @user = FactoryBot.create(:user)
          @article = FactoryBot.create(:article, owner: @user)
        end

        # 正常にレスポンスを返すこと
        it "responds successfully" do
          # 「@user」としてログイン
          sign_in @user
          # @userのidを渡して、showアクションを行う
          get :show, params: { id: @user.id }
          # レスポンスのステータスが「200（成功）」であることを確認
          expect(response).to be_successful
        end
      end
end