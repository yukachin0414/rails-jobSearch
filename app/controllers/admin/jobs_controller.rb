class Admin::JobsController < Admin::BaseController
  def index
      @jobs = Job.eager_load(:company).order(company_id: :desc, id: :desc)
  end

  def new
    @job = Job.new
    @companies = Company.all.order(id: :desc)
  end

  def create
    p = params.require(:job).permit(:company_id, :title, :income_upper, :income_lower, :description, images: [], skill_ids: [])
    @job = Job.new(p)
    if @job.save
      flash[:notice] = "作成しました id:#{@job.id}"
      redirect_to admin_jobs_path
    else
      @companies = Company.all.order(id: :desc)
      flash[:alerd] = '作成できませんでした'
      render :new
    end
  end

  def edit
    @skills = Skill.all.order(id: :asc)
    @job = Job.eager_load(:company).find(params[:id])
  end

  def update
    @job = Job.eager_load(:company).find(params[:id])
    p = params.require(:job).permit(:company_id, :title, :income_upper, :income_lower, :description, images: [], skill_ids: [])
    if @job.update(p)
      flash[:notice] = "更新しました id:#{@job.id}"
      redirect_to admin_jobs_path
    else
      flash[:alerd] = '更新できませんでした'
      render :edit
    end
  end
end
