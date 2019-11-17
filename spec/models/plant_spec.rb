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

require 'rails_helper'

RSpec.describe Plant, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
