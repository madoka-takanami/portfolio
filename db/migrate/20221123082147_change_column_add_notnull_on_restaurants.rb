class ChangeColumnAddNotnullOnRestaurants < ActiveRecord::Migration[6.1]
  def change
    change_column :restaurants, :rst_type, :integer, null: false, default: 0
  end
end
