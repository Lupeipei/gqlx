class AddCategoryToWorks < ActiveRecord::Migration[5.2]
  def change
    add_column :works, :category, :string

    QinPoetry.update_all(category: 'essay')
    HanPoetry.update_all(category: 'yuefu')
    TangPoem.update_all(category: 'poetry')
    SongPoem.update_all(category: 'ci')
  end
end
