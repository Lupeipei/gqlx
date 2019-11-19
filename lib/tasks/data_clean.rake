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

  TangPoem.find_each do |poem|
    next unless poem.content.any? { |item| item.count("。") > 1 }

    new_content = []
    poem.content.each do |item|
      if item.count("。") > 1
        new_item = item.gsub("。", "。|").split("|")
        new_content.concat(new_item)
      else
        new_content.concat([item])
      end
    end

    poem.update(content: new_content)
  end
end
