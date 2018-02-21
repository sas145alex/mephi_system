class CreateDirections < ActiveRecord::Migration[5.1]
  def change
    create_table :directions do |t|
      t.string :name, null: false
      t.integer :status, null: false, unsighed: true
      t.date :receive_date, null: false
      t.date :nominated_date_end, null: false
      t.date :finish_date

      t.timestamps
    end

    # reversible do |dir|
    #   dir.up do
    #     execute "ALTER TABLE directions ADD CONSTRAINT
    #     chk_contract_start_date_greater_than_contract_end_date
    #     CHECK (contract_end_date > contract_start_date)"
    #   end
    # end

  end
end
