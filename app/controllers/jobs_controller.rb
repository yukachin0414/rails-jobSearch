class JobsController < BaseController
  def index
    @jobs = Job.eager_load(:company, :skills)
    @jobs = @jobs.where('companies.name LIKE ?', "%#{params[:company_name]}%") if params[:company_name].present?
    @jobs = @jobs.where('? <= jobs.income_upper', params[:income_lower]) if params[:income_lower].present?
    @jobs = @jobs.where('jobs.income_lower <= ?', params[:income_upper]) if params[:income_upper].present?
    @jobs = @jobs.where('EXISTS (SELECT skills.id FROM skills INNER JOIN jobs_skills ON jobs_skills.skill_id = skills.id WHERE jobs_skills.job_id = jobs.id AND skills.id IN (?))', params[:skill_ids]) if params[:skill_ids].present?
    @jobs = @jobs.order(company_id: :desc, id: :desc)
    @skills = Skill.all.order(id: :desc)
    @params = params
  end
  
  def show
    @job = Job.eager_load(:company).find(params[:id])
    @has_entry = Entry.where(user_id: current_user).where(job_id: @job.id).exists?
    @has_favorite = Favorite.where(user_id: current_user).where(job_id: @job.id).exists?
  end
end
