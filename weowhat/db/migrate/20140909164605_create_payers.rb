class CreatePayers < ActiveRecord::Migration
  def change
    create_table :payers do |t|
      t.integer :payment_id
      t.integer :user_id
      t.integer :weighting

      t.timestamps
    end
  end
end
