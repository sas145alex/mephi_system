class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.text :description, null: false
      t.integer :status, null: false, unsighed: true
      t.references :direction, foreign_key: true

      t.timestamps
    end
  end
end
