class HomeController < ApplicationController
  def index
    redirect_to jobs_path if current_user
  end
end
