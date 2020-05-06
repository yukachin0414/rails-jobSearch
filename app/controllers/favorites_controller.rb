class FavoritesController < BaseController
  def create
    favorite = Favorite.new(job_id: params[:job_id], user_id: current_user.id)
    if favorite.save
      flash[:notice] = 'お気に入り登録できました'
    else
      fllash[:alert] = 'お気に入り登録できませんでした'
    end
    redirect_to job_path(id: params[:job_id])
  end
end