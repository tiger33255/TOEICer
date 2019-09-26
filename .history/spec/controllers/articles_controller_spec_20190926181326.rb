require 'rails_helper'
RSpec.describe ArticlesController, type: :controller do
  describe "#index" do
    # indexアクションを行うとサインインページに遷移することを確認
    it "redirects to the sign-in page" do
      user_articles_path(user_id = none)
      expect(response).to redirect_to "/users/sign_in"
    end
  end
end