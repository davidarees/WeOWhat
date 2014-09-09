class CreateRecipients < ActiveRecord::Migration
  def change
    create_table :recipients do |t|
      t.integer :payment_id
      t.integer :user_id
      t.integer :weighting

      t.timestamps
    end
  end
end
