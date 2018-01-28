class PostDepartmentsController < ApplicationController
  before_action :set_post_department, only: [:show, :edit, :update, :destroy]

  # GET /post_departments
  def index
    @post_departments = PostDepartment.all
  end

  # GET /post_departments/1
  def show
  end

  # GET /post_departments/new
  def new
    @post_department = PostDepartment.new
  end

  # GET /post_departments/1/edit
  def edit
  end

  # POST /post_departments
  def create
    @post_department = PostDepartment.new(post_department_params)

    if @post_department.save
      redirect_to @post_department, notice: t('controllers.post_departments.actions.create.success')
    else
      render :new
    end
  end

  # PATCH/PUT /post_departments/1
  def update
    if @post_department.update(post_department_params)
      redirect_to @post_department, notice: t('controllers.post_departments.actions.update.success')
    else
      render :edit
    end
  end

  # DELETE /post_departments/1
  def destroy
    @post_department.destroy
    redirect_to post_departments_url, notice: t('controllers.post_departments.actions.destroy.success')
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post_department
      @post_department = PostDepartment.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def post_department_params
      params.require(:post_department).permit(:post_id, :department_id, :worker_id)
    end
end
