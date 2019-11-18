class CreateEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :entries do |t|
      t.text :content
      t.integer :no
      t.belongs_to :work
      t.timestamps
    end
  end
end