class UpdateToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :username, :string, null: false
    remove_column :users, :name, :string
    remove_column :users, :email, :string 
  end
end
