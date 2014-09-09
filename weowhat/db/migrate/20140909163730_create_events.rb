class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :fb_id
      t.string :name
      t.text :description
      t.boolean :active
      t.integer :base_currency_id
      t.integer :user_id
      t.date :start_time
      t.date :end_time
      t.string :location
      t.string :fb_owner
      t.integer :fb_time_zone

      t.timestamps
    end
  end
end
