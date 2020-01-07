require 'json'

namespace :cipai do
  desc "import cipai"
  task import: :environment do
    File.open(Rails.root.join('public','poems-cipai.json')).each do |line|
      ci_pai = JSON.parse(line)
      CiPai.create(name: ci_pai['name'], description: ci_pai['description'])
    end
  end

  desc "clean cipai"
  task clean: :environment do
    Work.all.find_each do |work|
      Entry.create(content: work.content.join(''), work: work) unless work.entry.present?

      title = work.title.split('·').first
      ci_pai = CiPai.where(name: title).take

      if ci_pai
        work.update(category: :ci) unless work.category&.ci?
        ci_pai.works << work unless ci_pai.work_ids.include?(work.id)
      elsif !work.category&.poetry?
        items = work.entry.content.split(/[，。；？]/)
        next unless items.all? { |i| i.length == 5 || i.length == 7 }

        work.update(category: :poetry)
      end
    end
  end
end
