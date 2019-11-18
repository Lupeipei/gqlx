class MigrateEntries < ActiveRecord::Migration[5.2]
  def change
    remove_column :entries, :no, :integer

    Work.find_each do |work|
      Entry.create!(work_id: work.id, content: work.content.join('').gsub(/[\r\n\s]+/, ''))
    end
  end
end
