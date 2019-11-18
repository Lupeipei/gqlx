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
#  category      :string
#

class Work < ApplicationRecord
  enumerize :category, in: [ :essay, :yuefu, :poetry, :ci, :song ]

  has_one :entry, dependent: :destroy
  has_many :plants
  has_many :suggestions, dependent: :destroy
  has_many :flips, dependent: :destroy

  validates :title, :dynasty, :author, :content, presence: true

  before_save :remove_blank_attribute_assign
  before_save :update_entry, on: :update, if: -> { will_save_change_to_content? }

  scope :without_essays, -> { where.not(category: :essay) }

  def self.fetch_type(type)
    if type&.include?("唐诗")
      TangPoem.name
    elsif type&.include?("宋词")
      SongPoem.name
    else
      Article.name
    end
  end

  def remove_blank_attribute_assign
    content.reject!(&:blank?)
    notes.reject!(&:blank?)
    translate.reject!(&:blank?)
    translate_res.reject!(&:blank?)
  end

  def update_entry
    new_content = content.join('').gsub(/[\r\n\s]+/, '')

    if entry.content != new_content
      entry.update(content: new_content)
    end
  end
end
