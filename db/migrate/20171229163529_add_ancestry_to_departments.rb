class AddAncestryToDepartments < ActiveRecord::Migration[5.1]
  def change
    add_column :departments, :ancestry, :string
    add_index :departments, :ancestry
  end
end
