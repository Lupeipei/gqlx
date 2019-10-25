require 'json'

task data_import: :environment do
  poem_paths = Dir[Rails.root.join('public', 'resource', '*.json')]

  poem_paths.each do |path|
    text = File.open(path).read
    text.each_line do |line|
      data = JSON.parse(line)
      work = Work.new
      work.attribute_names.each do |attribute|
        next if ["id", "prelude"].include?(attribute)
        if attribute == "title"
          work.title = data["name"]
        elsif attribute == "type"
          work.type = Work.fetch_type(data["type"])
        else
          work.send(attribute + "=", data[attribute])
        end
      end
      next unless work.valid?
      work.save
    end
  end
end
