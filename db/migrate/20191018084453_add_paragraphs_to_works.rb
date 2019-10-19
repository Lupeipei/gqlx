class AddParagraphsToWorks < ActiveRecord::Migration[5.2]
  def change
    remove_column :works, :content
    add_column :works, :paragraphs, :string, default: [], array: true
  end
end
