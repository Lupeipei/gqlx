require 'nokogiri'

task data_clean: :environment do
  # Work.find_each do |work|
  #   next unless work.content.join('').include?('<p>')

  #   doc = Nokogiri::HTML(work.content.join(''))

  #   parsed = doc.content.split('\n')
  #   if parsed.count == 1
  #     new_content = doc.content.sub("\n", '').gsub("。", "。|").split("|")
  #     work.update(content: new_content)
  #   else
  #     work.update(content: parsed)
  #   end
  # end

  # TangPoem.find_each do |poem|
  #   next unless poem.content.any? { |item| item.count("。") > 1 }

  #   new_content = []
  #   poem.content.each do |item|
  #     if item.count("。") > 1
  #       new_item = item.gsub("。", "。|").split("|")
  #       new_content.concat(new_item)
  #     else
  #       new_content.concat([item])
  #     end
  #   end

  #   poem.update(content: new_content)
  # end
  # CIPAI = [
  #   "十六字令",
  #   "梧桐影",
  #   "南歌子",
  #   "南歌子",
  #   "捣练子",
  #   "忆江南",
  #   "渔歌子",
  #   "西楼月",
  #   "寿阳曲",
  #   "寿阳曲",
  #   "甘州曲",
  #   "忆王孙",
  #   "调笑令",
  #   "寿阳曲",
  #   "遐方怨",
  #   "如梦令",
  #   "甘州曲",
  #   "相见欢",
  #   "乌夜啼",
  #   "长相思",
  #   "生查子",
  #   "昭君怨",
  #   "点绛唇",
  #   "浣溪沙",
  #   "菩萨蛮",
  #   "卜算子",
  #   "采桑子",
  #   "减字木兰花",
  #   "谒金门",
  #   "诉衷情",
  #   "忆秦娥",
  #   "清平乐",
  #   "更漏子",
  #   "阮郎归",
  #   "画堂春",
  #   "桃源忆故人",
  #   "摊破浣溪沙",
  #   "贺圣朝",
  #   "太常引",
  #   "武陵春",
  #   "西江月",
  #   "少年游",
  #   "南歌子",
  #   "醉花阴",
  #   "浪淘沙",
  #   "怨王孙",
  #   "鹧鸪天",
  #   "鹊桥仙",
  #   "虞美人",
  #   "南乡子",
  #   "玉楼春",
  #   "一斛珠",
  #   "踏莎行",
  #   "小重山",
  #   "钗头凤",
  #   "蝶恋花",
  #   "一剪梅",
  #   "临江仙",
  #   "渔家傲",
  #   "唐多令",
  #   "河传",
  #   "苏幕遮",
  #   "定风波",
  #   "破阵子",
  #   "喝火令",
  #   "锦缠道",
  #   "如意令",
  #   "谢池春",
  #   "青玉案",
  #   "天仙子",
  #   "江城子",
  #   "离亭燕",
  #   "何满子",
  #   "一丛花",
  #   "御街行",
  #   "蓦山溪",
  #   "洞仙歌",
  #   "满江红",
  #   "水调歌头",
  #   "满庭芳",
  #   "八声甘州",
  #   "木兰花令",
  #   "声声慢",
  #   "失调名",
  #   "长亭怨",
  #   "昼夜乐",
  #   "双双燕",
  #   "凤池吟",
  #   "念奴娇",
  #   "桂枝香",
  #   "翠楼吟",
  #   "石州慢",
  #   "水龙吟",
  #   "雨霖铃",
  #   "春云怨",
  #   "永遇乐",
  #   "绮寮怨",
  #   "望海潮",
  #   "沁园春",
  #   "贺新郎",
  #   "摸鱼儿",
  #   "迈陂塘",
  #   "六洲歌头",
  #   "莺啼序",
  #   "瑞鹧鸪"
  # ]

  # Work.where(category: :ci).find_each do |work|
  #   # work.content.first.split('')
  #   items = work.entry.content.split(/[，。]/)
  #   next unless items.all? { |i| i.length == 5 || i.length == 7 }

  #   work.update(category: :poetry)
  # end
  # Work.where(category: :poetry).find_each do |work|
  #   cipai = work.title.split(/[·（\s]/).first
  #   next unless CIPAI.include?(cipai)

  #   work.update(category: :ci)
  # end
  # list.uniq.sort.each do |item|
  #   puts item
  # end
end
