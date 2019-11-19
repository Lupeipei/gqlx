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
class Flip < ApplicationRecord
  belongs_to :user
  belongs_to :work
end
