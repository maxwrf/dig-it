class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  before_action :flag_home, only: :home
  before_action :flag_other, only: [:dashboard, :dashboard_edit, :dashboard_update]

  def home
    # probs takes first 8 (thought technically not ordered
    # TODO: add 'featured' attr to diggers more manual curation
    @diggers = Digger.all
  end

  def dashboard
    @user = current_user
    authorize @user
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

  def flag_home
    @home = true
  end

  def flag_other
    @other = true
  end
end
