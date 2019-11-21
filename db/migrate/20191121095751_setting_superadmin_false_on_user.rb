class SettingSuperadminFalseOnUser < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :superadmin, :boolean, default: false
  end
end
