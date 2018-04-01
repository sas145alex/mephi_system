class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  def index
    @posts = Post.all
  end

  # GET /posts/1
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  def create
    # raise params.inspect

    @post = Post.new(post_params)

    if @post.save
      redirect_to @post, notice: t('controllers.posts.actions.create.success')
    else
      render :new
    end
  end

  # PATCH/PUT /posts/1
  def update
    # raise params.inspect

    if @post.update(post_params)
      redirect_to @post, notice: t('controllers.posts.actions.update.success')
    else
      render :edit
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy
    redirect_to posts_url, notice: t('controllers.posts.actions.destroy.success')
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def post_params
      params.require(:post).permit(
        :code, :name, :manager, department_ids: []
         # post_departments_attributes:
         #  [:_destroy, :department_id, :id, department_attributes:
         #    Department.attributes_names.push(:_destroy)]
      )
    end
end
