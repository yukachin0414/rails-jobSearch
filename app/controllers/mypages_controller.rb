class MypagesController < BaseController
  def show
    @entries = Entry.where(user_id: current_user).order(id: :desc)
    @favorites = Favorite.where(user_id: current_user).order(id: :desc)
  end
end
