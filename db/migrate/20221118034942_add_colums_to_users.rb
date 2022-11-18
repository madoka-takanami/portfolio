class AddColumsToUsers < ActiveRecord::Migration[6.1]
  def change
    change_column_null :users, :name, false
    add_column :users, :email, :string,  null: false
    add_column :users, :generation, :string
    add_column :users, :introduction, :string, limit: 200
    add_column :users, :password, :string, null: false
    add_column :users, :avator, :string
    add_column :users, :notion, :boolean, null: false, default: true
  end
end
