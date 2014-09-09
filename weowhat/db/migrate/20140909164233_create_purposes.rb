class CreatePurposes < ActiveRecord::Migration
  def change
    create_table :purposes do |t|
      t.string :purpose_text
      t.integer :no_times_used

      t.timestamps
    end
  end
end
