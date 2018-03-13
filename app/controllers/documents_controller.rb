class DocumentsController < ApplicationController
  before_action :set_document, only: [
    :show, :edit, :update, :destroy, :download_file
  ]

  # GET /documents
  def index
    @documents = Document.all
  end

  # GET /documents/1
  def show
  end

  # GET /documents/new
  def new
    @document = Document.new
  end

  # GET /documents/1/edit
  def edit
  end

  # POST /documents
  def create
    @document = Document.new(document_params)

    if @document.save
      redirect_to @document, notice: t('controllers.documents.actions.create.success')
    else
      render :new
    end
  end

  # PATCH/PUT /documents/1
  def update
    if @document.update(document_params)
      redirect_to @document, notice: t('controllers.documents.actions.update.success')
    else
      render :edit
    end
  end

  # DELETE /documents/1
  def destroy
    @document.destroy
    redirect_to documents_url, notice: t('controllers.documents.actions.destroy.success')
  end



  def download_file
    # attachments[@document.content_file_name]=File.read("#{Rails.root}/public/assets/#{@image.content.url}")
    file = @document.doc
    send_file(
      # "#{Rails.root}/public" ++ file.url,
      file.path,
      filename: @document.doc_file_name,
      type: file.content_type,
      disposition: "attachment"
    )
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_document
      @document = Document.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def document_params
      params.require(:document).permit(:name, :doc_type, :task_id, :direction_id, :doc)
    end
end
