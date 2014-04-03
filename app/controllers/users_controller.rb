class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @wikis = @user.wikis
    @name = current_user.name || current_user.email
  end

end
