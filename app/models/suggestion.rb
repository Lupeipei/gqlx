# == Schema Information
#
# Table name: suggestions
#
#  id         :integer          not null, primary key
#  email      :string
#  comments   :text
#  work_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Suggestion < ApplicationRecord
  belongs_to :work
end
