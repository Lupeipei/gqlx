# == Schema Information
#
# Table name: works
#
#  id          :integer          not null, primary key
#  title       :string
#  dynasty     :string
#  author      :string
#  prelude     :string
#  explanation :text
#  type        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  paragraphs  :string           default("{}"), is an Array
#

class Work < ApplicationRecord
  validates :title, :dynasty, :author, :paragraphs, presence: true
end
