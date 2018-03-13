class CreateDocuments < ActiveRecord::Migration[5.1]
  def change
    create_table :documents do |t|
      t.string :name, null: false
      t.integer :type
      t.belongs_to :task, foreign_key: true
      t.belongs_to :direction, foreign_key: true

      t.timestamps
    end

    reversible do |dir|
      dir.up do
        execute "ALTER TABLE documents ADD CONSTRAINT
        at_least_one_link_must_exist
        CHECK (task_id > 0 )"
      end

      dir.down do
        execute "ALTER TABLE documents DROP CONSTRAINT
        at_least_one_link_must_exist"
      end
    end
  end
end
