class AddUserIdToSuggestions < ActiveRecord::Migration[5.2]
  def change
    change_table :suggestions do |t|
      t.belongs_to :user
    end
  end
end
