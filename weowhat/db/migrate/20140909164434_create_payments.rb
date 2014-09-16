class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.integer :event_id
      t.string :reason
      t.float :amount
      t.integer :currency_id
      t.timestamp :created

      t.timestamps
    end
  end
end
