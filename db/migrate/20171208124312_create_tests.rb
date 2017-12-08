class CreateTests < ActiveRecord::Migration[5.1]
  def change
    create_table :tests do |t|
      t.string :test_string
      t.integer :test_int

      t.timestamps
    end
  end
end
