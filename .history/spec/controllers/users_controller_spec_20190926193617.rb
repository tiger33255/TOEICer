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
end