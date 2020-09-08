class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(user_params)
    redirect_to dashboard_path
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :nickname, :favorite_sport, :skill_level, :age, :gender, :language, :description)
  end
end
