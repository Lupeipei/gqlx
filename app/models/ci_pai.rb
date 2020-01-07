# == Schema Information
#
# Table name: ci_pais
#
#  id          :integer          not null, primary key
#  name        :string
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class CiPai < ApplicationRecord
  has_many :works, through: :ci_pai_works
end
