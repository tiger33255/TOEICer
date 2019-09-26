require 'rails_helper'
RSpec.describe User, type: :model do
    context "データが正しく保存される" do
        before do
            @user = Article.new
            @user. = "Hello world"
            @article.body = "Good morning!"
            @article.save
        end
    end
end