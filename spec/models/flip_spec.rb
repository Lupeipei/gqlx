# == Schema Information
#
# Table name: flips
#
#  id         :integer          not null, primary key
#  work_id    :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Flip, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
