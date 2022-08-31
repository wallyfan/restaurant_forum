class AddFavoritesCountToRestaurants < ActiveRecord::Migration[7.0]
  def change
    add_column :restaurants, :favorites_count, :integer, default: 0
  end
end
