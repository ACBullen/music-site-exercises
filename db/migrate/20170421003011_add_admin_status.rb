class AddAdminStatus < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :admin_status, :boolean, null: false, default: false 
  end
end
