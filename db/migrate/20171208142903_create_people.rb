class CreatePeople < ActiveRecord::Migration[5.1]
  def change
    create_table :people do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :second_name
      t.date :birthday, null: false
      t.string :passport, unique: true

      t.timestamps
    end
  end
end
