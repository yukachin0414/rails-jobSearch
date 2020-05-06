class Admin::UsersController < Admin::BaseController
  def index
    @users = User.eager_load(:entries, :favorites).order(id: :desc)
  end

  def show
    @user = User.eager_load(:entries, :favorites).find(params[:id])
  end
end