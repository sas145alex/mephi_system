class AddPostDepartmentToWorkers < ActiveRecord::Migration[5.1]
  change_table(:workers) do |t|
    t.belongs_to :post_department, index: true
  end
end
