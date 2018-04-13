class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy, :delegation]

  # GET /tasks
  def index()
    direction = params[:direction]
    if direction
      @tasks = Direction.find(direction).task.subtree
    else
      @tasks = Task.all
    end
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
    @workers_info = PostDepartment.joins(:department, :post)
      .where(department: Department.find(params[:department_id]))
      .joins(workers: :person)
      .select('people.second_name', 'people.first_name',
        'people.last_name', 'posts.name', 'posts.manager',
        'workers.id as worker_id')

    respond_to do |format|
      format.js
    end
  end

  def show_all_delegation

  end

  def show_delegation_to_me

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
      params.require(:task).permit(:description, :status, :direction_id, :ancestry, :nominated_end_date, worker_ids: [])
    end
end
