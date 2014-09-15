class AddPurposeToPayments < ActiveRecord::Migration
  def change
    add_column :payments, :reason, :string
  end
end
