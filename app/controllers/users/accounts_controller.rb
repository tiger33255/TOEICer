class Users::AccountsController < ApplicationController
    def index
        @user = current_user
    end

    private


end
