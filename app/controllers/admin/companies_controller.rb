class Admin::CompaniesController < Admin::BaseController
  def index
    @companies = Company.all.order(id: :desc)
  end

  def new
    @company = Company.new
  end

  def create
    p = params.require(:company).permit(:name, :logo)
    @company = Company.new(p)
    if @company.save
      flash[:notice] = "作成しました id:#{@company.id}"
      redirect_to admin_companies_path
    else
      flash[:alerd] = '作成できませんでした'
      render :new
    end
  end

  def edit
    @company = Company.find(params[:id])
  end

  def update
    @company = Company.find(params[:id])
    p = params.require(:company).permit(:name, :logo)
    if @company.update(p)
      flash[:notice] = "更新しました id:#{@company.id}"
      redirect_to admin_companies_path
    else
      flash[:alerd] = '更新できませんでした'
      render :edit
    end
  end
end
