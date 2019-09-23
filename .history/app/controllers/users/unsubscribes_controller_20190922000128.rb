class Users::UnsubscribesController < ApplicationController

  def edit
      @user = User.find(params[:user_id])
  end

  def destroy
      user = User.find(current_user.id)
      user.destroy
      redirect_to root_path
  end
end