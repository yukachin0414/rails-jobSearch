class Admin::BaseController < ApplicationController
  layout 'admin'
  before_action :require_admin

  private

  def require_admin
    return redirect_to root_path unless admin_signed_in?
  end
end
