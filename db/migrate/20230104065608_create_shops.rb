class CreateShops < ActiveRecord::Migration[7.0]
  def change
    create_table :shops do |t|
      t.string :place
      t.string :shop_name
      t.string :adress

      t.timestamps
    end
  end
end
