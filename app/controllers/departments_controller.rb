class DepartmentsController < ApplicationController
  before_action :set_department, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token # иначе ошибка в ajax из jquery

  # GET /departments
  def index
    @departments = Department.all
  end

  # GET /departments/1
  def show
  end

  # GET /departments/new
  def new
    @department = Department.new
  end

  # GET /departments/1/edit
  def edit
  end

  # POST /departments
  def create
    @department = Department.new(department_params)

    if @department.save
      redirect_to @department, notice: t('controllers.departments.actions.create.success')
    else
      render :new
    end
  end

  # PATCH/PUT /departments/1
  def update
    # raise params.to_s

    if @department.update(department_params)
      redirect_to @department, notice: t('controllers.departments.actions.update.success')
    else
      render :edit
    end
  end

  # DELETE /departments/1
  def destroy
    @department.destroy
    redirect_to departments_url, notice: t('controllers.departments.actions.destroy.success')
  end

  def fill_existing_post_form
    # raise "ПАРАМЕТРЫ #{params.to_s}"

    @post = Post.find(params[:selected_post_id])
    @timestamp = params[:timestamp].to_i
    @attrs = Post.attributes_names
    respond_to do |format|
      # отдаем данные на скрипт
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_department
      @department = Department.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def department_params
      params.require(:department).permit(Department.attributes_names + [:_destroy],
        post_departments_attributes: [
          PostDepartment.attributes_names + [:_destroy], post_attributes: Post.attributes_names
        ]
      )
    end
end
