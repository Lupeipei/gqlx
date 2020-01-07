require 'nokogiri'

namespace :database do
  desc "clean Data"
  task clean: :environment do
    Work.all.find_each do |work|
    # 清 html tag
      docs = work.content.join('')
      docs = Nokogiri::HTML(docs).content.gsub(/\n/, '')

      next unless docs

      new_content = docs.gsub!('。', '。|')&.split('|')
      next unless new_content

      work.update(content: new_content)

      next if work.category.present?

      #  update category
      if work.is_a? QinPoetry
        work.update(category: :song)
      elsif work.is_a? SongPoem
        work.update(category: :ci)
      elsif work.is_a? TangPoem
        work.update(category: :poetry)
      else
        items = docs.split(/[，。]/)
        next unless items.all? { |i| i.length == 5 || i.length == 7 }

        work.update(category: :poetry)
      end
    end
  end
end
