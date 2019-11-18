# == Schema Information
#
# Table name: entries
#
#  id         :integer          not null, primary key
#  content    :text
#  work_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Entry, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
