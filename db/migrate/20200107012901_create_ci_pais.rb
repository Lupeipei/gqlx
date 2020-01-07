class CreateCiPais < ActiveRecord::Migration[5.2]
  def change
    create_table :ci_pais do |t|
      t.string :name
      t.string :description
      t.timestamps
    end

    create_table :ci_pai_works do |t|
      t.belongs_to :work
      t.belongs_to :ci_pai
    end
  end
end
