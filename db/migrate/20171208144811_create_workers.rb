class CreateWorkers < ActiveRecord::Migration[5.1]
  def change
    create_table :workers do |t|
      t.date :contract_start_date, null: false
      t.date :contract_end_date, null: false
      t.integer :status, null: false, unsighed: true
      t.references :person, foreign_key: true

      t.timestamps
    end

    reversible do |dir|
      dir.up do
        execute "ALTER TABLE workers ADD CONSTRAINT
        chk_contract_start_date_greater_than_contract_end_date
        CHECK (contract_end_date > contract_start_date)"
      end
      dir.down do
        execute "ALTER TABLE workers DROP CONSTRAINT
        chk_contract_start_date_greater_than_contract_end_date"
      end
    end

  end
end
