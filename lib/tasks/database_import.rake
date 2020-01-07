require 'json'
namespace :database do
  desc "import Data"
  task import: :environment do
    paths = [
      Rails.root.join('public', 'poems1.json'),
      Rails.root.join('public', 'poems2.json'),
      Rails.root.join('public', 'poems3.json'),
      Rails.root.join('public', 'poems4.json')
    ]
    paths.each do |path|
      File.open(path).each do |line|
        poem = JSON.parse(line)
        next unless poem['name'].present? && poem['dynasty'].present? && poem['author'].present? && poem['content'].present?

        work = Work.new
        work.title = poem['name']
        work.dynasty = poem['dynasty']
        work.author = poem['author']
        work.content = poem['content']
        work.notes = poem['notes']
        work.translate = poem['translate']
        work.translate_res = poem['translate_res']

        case poem['dynasty']
        when '唐代'
          work.type = TangPoem
        when '宋代'
          work.type = SongPoem
        when '两汉'
          work.type = HanPoetry
        when '先秦'
          work.type = QinPoetry
        else
          work.type = Article
        end

        work.category = :poetry if poem['type'] == '唐诗三百首'
        work.category = :ci if poem['type'] == '词牌'
        work.category = :yuefu if poem['tags'].include?("乐府")
        work.category = :drama if poem['dynasty'] == '元代'
        work.save!
      end
    end
  end
end
