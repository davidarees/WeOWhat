class AddPurposeToPayments < ActiveRecord::Migration
  def change
    add_column :payments, :purpose, :string
  end
end
