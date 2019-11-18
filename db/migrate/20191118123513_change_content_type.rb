class ChangeContentType < ActiveRecord::Migration[5.2]
  def change
    change_column :works, :content, :text, default: [], array: true
  end
end
