class UsersController < ApplicationController
  def edit
  	@user = current_user
  end

  def update
  	@user = current_user
  	@user.update_attributes user_params
  	redirect_to root_url
  end

  def user_params
  	params.require(:user).permit(:first_name, :last_name)
  end
end
