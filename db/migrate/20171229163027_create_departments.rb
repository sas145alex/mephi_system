class CreateDepartments < ActiveRecord::Migration[5.1]
  def change
    create_table :departments do |t|
      t.string :name, null: false, unique: true
      t.text :description, null: false

      t.timestamps
    end
  end
end
