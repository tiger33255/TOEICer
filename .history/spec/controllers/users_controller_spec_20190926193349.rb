require 'rails_helper'
RSpec.describe UsersController, type: :controller do
    describe　'user#index' do
        context "get user#index accurately" do
            before do
                get :index
            end
        it 'get request200' do
          expect(response.status).to eq 200
        end
      end
    end
    describe 'user#show' do
        context "get user#show accurately" do
            before do
                @user = create(:user)
                get :show
            end
        it 'get request200' do
            expect(response.status).to eq 200
        end
    end
end