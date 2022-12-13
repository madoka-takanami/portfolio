class CreateSpots < ActiveRecord::Migration[6.1]
  def change
    create_table :spots do |t|
      t.string :address, null: false
      t.float :latitude
      t.float :longitude
      t.string :rst_place
      t.references :user

      t.timestamps
    end
  end
end
