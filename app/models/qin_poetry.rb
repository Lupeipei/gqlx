# == Schema Information
#
# Table name: works
#
#  id            :integer          not null, primary key
#  title         :string
#  dynasty       :string
#  author        :string
#  prelude       :string
#  type          :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  notes         :string           default("{}"), is an Array
#  translate     :string           default("{}"), is an Array
#  translate_res :string           default("{}"), is an Array
#  content       :string           default("{}"), is an Array
#

class QinPoetry < Work
end
