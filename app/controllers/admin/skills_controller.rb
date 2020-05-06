class Admin::SkillsController < Admin::BaseController
  def index
      @skills = Skill.all.order(id: :desc)
  end

  def new
    @skill = Skill.new
  end

  def create
    p = params.require(:skill).permit(:name)
    @skill = Skill.new(p)
    if @skill.save
      flash[:notice] = "作成しました id:#{@skill.id}"
      redirect_to admin_skills_path
    else
      flash[:alerd] = '作成できませんでした'
      render :new
    end
  end

  def edit
    @skill = Skill.find(params[:id])
  end

  def update
    @skill = Skill.find(params[:id])
    p = params.require(:skill).permit(:name)
    if @skill.update(p)
      flash[:notice] = "更新しました id:#{@skill.id}"
      redirect_to admin_skills_path
    else
      flash[:alerd] = '更新できませんでした'
      render :edit
    end
  end
end
