class AddRatingToShops < ActiveRecord::Migration[7.0]
  def change
    add_column :shops, :rating, :integer
  end
end
