class DeletePurposeIdFromPayments < ActiveRecord::Migration
  def change
    remove_column :payments, :purpose_id
  end
end
