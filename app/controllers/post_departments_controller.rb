class PostDepartmentsController < ApplicationController
  before_action :set_post_department, only: [:show, :edit, :update, :destroy]

  # GET /post_departments
  # GET /post_departments.json
  def index
    @post_departments = PostDepartment.all
  end

  # GET /post_departments/1
  # GET /post_departments/1.json
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
  # POST /post_departments.json
  def create
    @post_department = PostDepartment.new(post_department_params)

    respond_to do |format|
      if @post_department.save
        format.html { redirect_to @post_department, notice: 'Post department was successfully created.' }
        format.json { render :show, status: :created, location: @post_department }
      else
        format.html { render :new }
        format.json { render json: @post_department.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /post_departments/1
  # PATCH/PUT /post_departments/1.json
  def update
    respond_to do |format|
      if @post_department.update(post_department_params)
        format.html { redirect_to @post_department, notice: 'Post department was successfully updated.' }
        format.json { render :show, status: :ok, location: @post_department }
      else
        format.html { render :edit }
        format.json { render json: @post_department.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /post_departments/1
  # DELETE /post_departments/1.json
  def destroy
    @post_department.destroy
    respond_to do |format|
      format.html { redirect_to post_departments_url, notice: 'Post department was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post_department
      @post_department = PostDepartment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_department_params
      params.require(:post_department).permit(:post_id, :department_id, :worker_id)
    end
end
