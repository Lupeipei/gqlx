class CreatePlants < ActiveRecord::Migration[5.2]
  def change
    create_table :plants do |t|
      t.string :fragment
      t.belongs_to :work
      t.timestamps
    end
  end
end
