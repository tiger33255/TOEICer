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
    end
end