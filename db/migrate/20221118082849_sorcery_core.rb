class SorceryCore < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :email, :string, null: false, index: { unique: true }
    add_column :users, :crypted_password, :string
    add_column :users, :salt, :string
  end
end
