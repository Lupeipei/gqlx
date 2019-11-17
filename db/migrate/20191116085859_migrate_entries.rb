class MigrateEntries < ActiveRecord::Migration[5.2]
  def change
    rename_column :entries, :partition, :content
    rename_column :entries, :order, :no

    Work.first(2).each do |work|
      work.content.each_with_index do |item, index|
        work.entries.create!(content: item.gsub(/[\r\n\s]+/, ''), no: index + 1)
      end
    end
  end
end
