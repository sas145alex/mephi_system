class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy, :delegation]

  # GET /tasks
  def index
    @tasks = Task.all
  end

  # GET /tasks/1
  def show
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  def create
    # raise params.inspect
    @task = Task.new(task_params)

    if @task.save
      redirect_to @task, notice: t('controllers.tasks.actions.create.success')
    else
      render :new
    end
  end

  # PATCH/PUT /tasks/1
  def update
    if @task.update(task_params)
      redirect_to @task, notice: t('controllers.tasks.actions.update.success')
    else
      render :edit
    end
  end

  def delegation

  end

  # path/put /tasks/1
  # def put_delegation
  #   raise params.inspect
  # end

  def build_worker_cards
    # raise "ПАРАМЕТРЫ #{params.to_s}"
    @department = Department.where(id: params[:department_id]).first
    # @timestamp = params[:timestamp].to_i
    respond_to do |format|
      format.js
    end
  end

  # DELETE /tasks/1
  def destroy
    @task.destroy
    redirect_to tasks_url, notice: t('controllers.tasks.actions.destroy.success')
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def task_params
      params.require(:task).permit(:description, :status, :direction_id, :ancestry)
    end
end
