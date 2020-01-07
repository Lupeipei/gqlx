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
#  content       :text             default("{}"), is an Array
#  category      :string
#

class Work < ApplicationRecord
  enumerize :category, in: [ :essay, :yuefu, :poetry, :ci, :song, :drama ]

  has_one :entry, dependent: :destroy
  has_many :plants
  has_many :suggestions, dependent: :destroy
  has_many :flips, dependent: :destroy
  has_many :ci_pai_works, dependent: :destroy

  validates :title, :dynasty, :author, :content, presence: true

  before_save :remove_blank_attribute_assign
  after_create :ensure_entry
  before_update :update_entry, on: :update, if: -> { will_save_change_to_content? }

  scope :without_essays, -> { where.not(category: :essay) }

  def remove_blank_attribute_assign
    content.reject!(&:blank?)
    notes.reject!(&:blank?)
    translate.reject!(&:blank?)
    translate_res.reject!(&:blank?)
  end

  def ensure_entry
    entry = Entry.new(work_id: self.id)
    entry.content = content.join('').gsub(/[\r\n\s]+/, '')
    entry.save
  end

  def update_entry
    new_content = content.join('').gsub(/[\r\n\s]+/, '')

    if entry.content != new_content
      entry.update(content: new_content)
    end
  end
end
