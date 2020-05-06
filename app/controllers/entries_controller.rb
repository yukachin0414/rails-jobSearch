class EntriesController < BaseController
  def create
    entry = Entry.new(job_id: params[:job_id], user_id: current_user.id)
    if entry.save
      flash[:notice] = 'エントリーしました'
    else
      fllash[:alert] = 'エントリーできませんでした'
    end
    redirect_to job_path(id: params[:job_id])
  end
end
