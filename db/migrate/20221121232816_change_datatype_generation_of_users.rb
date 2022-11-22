class ChangeDatatypeGenerationOfUsers < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :generation, :integer, using: "generation::integer"
  end
end
