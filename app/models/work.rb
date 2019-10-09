# == Schema Information
#
# Table name: works
#
#  id          :integer          not null, primary key
#  title       :string
#  dynasty     :string
#  author      :string
#  prelude     :string
#  content     :string
#  explanation :text
#  type        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Work < ApplicationRecord
  validates :title, :dynasty, :author, :content, :explanation, presence: true
end
