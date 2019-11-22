class MigrateEntries < ActiveRecord::Migration[5.2]
  def change
    Work.find_each do |work|
      Entry.create!(work_id: work.id, content: work.content.join('').gsub(/[\r\n\s]+/, ''))
    end
  end
end
