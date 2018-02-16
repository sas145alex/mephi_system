class CreateDirections < ActiveRecord::Migration[5.1]
  def change
    create_table :directions do |t|
      t.string :name
      t.integer :status
      t.date :receive_date
      t.date :nominated_date_end
      t.date :finish_date

      t.timestamps
    end
  end
end
