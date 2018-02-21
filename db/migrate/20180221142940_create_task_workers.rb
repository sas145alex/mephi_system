class CreateTaskWorkers < ActiveRecord::Migration[5.1]
  def change
    create_table :task_workers do |t|
      t.integer :status, null: false, unsighed: true
      t.integer :answer, null: false, unsighed: true
      t.text :comment, null: false
      t.datetime :receive_date, null: false
      t.datetime :finish_date
      t.belongs_to :worker, foreign_key: true
      t.belongs_to :task, foreign_key: true

      t.timestamps
    end
  end
end
