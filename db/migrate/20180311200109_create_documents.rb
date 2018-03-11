class CreateDocuments < ActiveRecord::Migration[5.1]
  def change
    create_table :documents do |t|
      t.string :name
      t.integer :type
      t.belongs_to :task, foreign_key: true
      t.belongs_to :direction, foreign_key: true

      t.timestamps
    end
  end
end
