class TaskWorkersController < ApplicationController
  before_action :set_task_worker, only: [:show, :edit, :update, :destroy]

  # GET /task_workers
  def index
    @task_workers = TaskWorker.all
  end

  # GET /task_workers/1
  def show
  end

  # GET /task_workers/new
  def new
    @task_worker = TaskWorker.new
  end

  # GET /task_workers/1/edit
  def edit
  end

  # POST /task_workers
  def create
    @task_worker = TaskWorker.new(task_worker_params)

    if @task_worker.save
      redirect_to @task_worker, notice: t('controllers.task_workers.actions.create.success')
    else
      render :new
    end
  end

  # PATCH/PUT /task_workers/1
  def update
    if @task_worker.update(task_worker_params)
      redirect_to @task_worker, notice: t('controllers.task_workers.actions.update.success')
    else
      render :edit
    end
  end

  # DELETE /task_workers/1
  def destroy
    @task_worker.destroy
    redirect_to task_workers_url, notice: t('controllers.task_workers.actions.destroy.success')
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task_worker
      @task_worker = TaskWorker.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def task_worker_params
      params.require(:task_worker).permit(:status, :receive_date, :finish_date, :answer, :comment, :worker_id, :task_id)
    end
end
