class CreateRestaurants < ActiveRecord::Migration[6.1]
  def change
    create_table :restaurants do |t|
      t.string :rst_type
      t.string :rst_name, null: false
      t.string :place
      t.string :feature
      t.string :memo, limit: 300
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
