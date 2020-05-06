class BaseController < ApplicationController
  layout 'user'
  before_action :require_user

  private

  def require_user
    return redirect_to root_path unless user_signed_in?
  end
end
