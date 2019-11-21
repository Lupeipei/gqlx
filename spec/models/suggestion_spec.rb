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
#  user_id    :integer
#

require 'rails_helper'

RSpec.describe Suggestion, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
