module DocumentsHelper
  def link_to_download_file(document)
    render partial: 'link_to_download_file',
      object: document, as: 'document'
  end
end
