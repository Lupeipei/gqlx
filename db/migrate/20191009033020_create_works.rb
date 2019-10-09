class CreateWorks < ActiveRecord::Migration[5.2]
  def change
    create_table :works do |t|
      t.string :title
      t.string :dynasty
      t.string :author
      t.string :prelude
      t.string :content
      t.text :explanation
      t.string :type
      t.timestamps
    end
  end
end
