require 'rails_helper'
RSpec.describe User, type: :model do
    context "データが正しく保存される" do
        before do
            @user = Article.new
            @user.email = "rspec@test.com"
            @user.password = "111111"
            @user.first_name = "田中"
            @user.last_name = "太郎"
            @user.nickname = "タロちゃん"
            @user.toeic_score = "990"
                end
    end
end