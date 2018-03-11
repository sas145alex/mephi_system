json.extract! document, :id, :name, :type, :task_id, :direction_id, :created_at, :updated_at
json.url document_url(document, format: :json)
