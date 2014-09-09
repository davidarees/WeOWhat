class CreateCurrencies < ActiveRecord::Migration
  def change
    create_table :currencies do |t|
      t.string :iso_code
      t.float :exchange_rate

      t.timestamps
    end
  end
end
