class ChangeExplanationTypeOnWorks < ActiveRecord::Migration[5.2]
  def change
    remove_column :works, :paragraphs, :string, default: [], array: true
    remove_column :works, :explanation, :text
    remove_column :works, :explanation_res, :string, default: [], array: true
    add_column :works, :translate, :string, default: [], array: true
    add_column :works, :translate_res, :string, default: [], array: true
    add_column :works, :content, :string, default: [], array: true
  end
end
