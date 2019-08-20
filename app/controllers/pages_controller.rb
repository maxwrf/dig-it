class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def dashboard
    @user = current_user
  end

  def dashboard_edit
    @user = current_user
  end

  def dashboard_update
    @user = current_user
    if @user.update(user_params)
      redirect_to dashboard_path
    else
      render :dashboard_edit
    end
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :photo)
  end
end
