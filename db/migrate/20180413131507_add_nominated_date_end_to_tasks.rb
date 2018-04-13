class AddNominatedDateEndToTasks < ActiveRecord::Migration[5.1]
  def change
    add_column :tasks, :nominated_date_end, :date, null: false
  end
end
