class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :code, null: false, unique: true
      t.string :name, null: false

      t.timestamps
    end
  end
end
