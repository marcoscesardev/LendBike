class AddNameToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string, null: false
    add_column :users, :is_admin, :boolean, null: false, default: false
    add_column :users, :active, :boolean, null: false, default: true
  end
end
