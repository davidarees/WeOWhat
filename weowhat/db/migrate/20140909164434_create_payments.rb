class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.float :amount
      t.integer :purpose_id
      t.integer :event_id
      t.integer :currency_id
      t.timestamp :created

      t.timestamps
    end
  end
end
