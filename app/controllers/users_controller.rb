class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])

    @topics = Topic.where(user: @user)
  end
end
