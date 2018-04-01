class DirectionsController < ApplicationController
  before_action :set_root_task, only: [:initial_delegation]
  before_action :set_direction, only: [:show, :edit, :update, :destroy, :initial_delegation]

  # GET /directions
  def index
    @directions = Direction.all
  end

  # GET /directions/1
  def show
  end

  # GET /directions/new
  def new
    @direction = Direction.new
  end

  # GET /directions/1/edit
  def edit
  end

  # POST /directions
  def create
    @direction = Direction.new(direction_params)


    if @direction.save
      redirect_to @direction, notice: t('controllers.directions.actions.create.success')
    else
      render :new
    end
  end

  # PATCH/PUT /directions/1
  def update
    if @direction.update(direction_params)
      redirect_to @direction, notice: t('controllers.directions.actions.update.success')
    else
      render :edit
    end
  end

  # DELETE /directions/1
  def destroy
    @direction.destroy
    redirect_to directions_url, notice: t('controllers.directions.actions.destroy.success')
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_direction
      @direction = Direction.find(params[:id])
    end

    def set_root_task
      @task = Direction.find(params[:id]).task
    end

    # Only allow a trusted parameter "white list" through.
    def direction_params
      # raise params
      params.require(:direction).permit(Direction.attributes_names + [:_destroy],
          documents_attributes: [
            Document.attributes_names + [:_destroy, :doc]
          ]
        )
    end
end
