class AddFieldsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :is_admin?, :boolean
    add_column :users, :is_cashier?, :boolean
  end
end
