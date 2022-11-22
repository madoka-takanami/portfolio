class ChangeDatatypeRestaurants < ActiveRecord::Migration[6.1]
  def up
    change_column :restaurants, :rst_type, :integer, using: "rst_type::integer"
  end

  def down
    change_column :restaurants, :rst_type, :string, using: "rst_type::string"
  end
end
