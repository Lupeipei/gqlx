class CreateFlips < ActiveRecord::Migration[5.2]
  def change
    create_table :flips do |t|
      t.belongs_to :work
      t.belongs_to :user
      t.timestamps
    end
  end
end
