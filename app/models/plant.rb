# == Schema Information
#
# Table name: plants
#
#  id         :integer          not null, primary key
#  fragment   :string
#  work_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Plant < ApplicationRecord
  belongs_to :work
end
