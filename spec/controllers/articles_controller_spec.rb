require 'rails_helper'
RSpec.describe ArticlesController, type: :controller do
describe "#destroy" do
    context "if logged in user deletes another user" do
        before do
            @user = FactoryBot.create(:user)
            other_user = FactoryBot.create(:other_user)
            @article = FactoryBot.create(:article, user_id: other_user.id)
        end

    it "does not delete article" do
        sign_in @user

        expect {
            delete :destroy, params: { id: @article.id, user_id: @user.id }
        }
        end

    context "as a user not to login" do
        before do
            @article = FactoryBot.create(:article, user_id: @user.id)
        end

        it "returns a 302 response" do
            delete :destroy, params: { id: @article.id, user_id: @user.id }
            expect(response).to have_http_status "302"
        end

        it "does not delete the task" do
            expect {
                delete :destroy, params: { id: @article.id, user_id: @user.id }
            }
        end

    end
end
end
end
