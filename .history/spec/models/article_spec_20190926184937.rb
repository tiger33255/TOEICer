require 'rails_helper'
RSpec.describe Article, type: :model do
    context "データが正しく保存される" do
        before do
            user = create(:user)
            @article = Article.new
            @article.title = "Hello world"
            @article.body = "Good morning!"
            @article.save
        end
        it "全て入力してあるので保存される" do
            user = { create(:user, :skip_validate) }
            user.valid?
            expect(@article).to be_valid
        end
    end
end