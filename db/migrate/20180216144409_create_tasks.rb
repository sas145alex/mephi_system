class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.text :description
      t.integer :status
      t.references :direction, foreign_key: true

      t.timestamps
    end
  end
end
