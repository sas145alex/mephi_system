class CreatePostDepartments < ActiveRecord::Migration[5.1]
  def change
    create_table :post_departments do |t|
      t.references :post, foreign_key: true, null: false
      t.references :department, foreign_key: true, null: false
      # t.belongs_to :worker, foreign_key: true, null: false

      t.index [:post_id, :department_id], unique: true,
        name: 'index_post_departments_for_uniqueness_relations_post_department'

      t.timestamps
    end
  end
end
