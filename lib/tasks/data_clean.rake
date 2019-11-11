require 'nokogiri'

task data_clean: :environment do
  Work.find_each do |work|
    next unless work.content.join('').include?('<p>')

    doc = Nokogiri::HTML(work.content.join(''))

    parsed = doc.content.split('\n')
    if parsed.count == 1
      new_content = doc.content.sub("\n", '').gsub("。", "。|").split("|")
      work.update(content: new_content)
    else
      work.update(content: parsed)
    end
  end
end
