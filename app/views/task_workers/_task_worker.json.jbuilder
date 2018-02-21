json.extract! task_worker, :id, :status, :receive_date, :finish_date, :answer, :comment, :worker_id, :task_id, :created_at, :updated_at
json.url task_worker_url(task_worker, format: :json)
