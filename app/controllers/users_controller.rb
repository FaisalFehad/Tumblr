class UsersController < ApplicationController
  def list
    @users = User.all
  end

  def profile
    @user = User.find(params[:id])
  end
end
