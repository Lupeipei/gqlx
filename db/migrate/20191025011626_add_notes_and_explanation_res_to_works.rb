class AddNotesAndExplanationResToWorks < ActiveRecord::Migration[5.2]
  def change
    add_column :works, :notes, :string, default: [], array: true
    add_column :works, :explanation_res, :string, default: [], array: true
  end
end
