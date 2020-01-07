# == Schema Information
#
# Table name: ci_pai_works
#
#  id        :integer          not null, primary key
#  work_id   :integer
#  ci_pai_id :integer
#


class CiPaiWork < ApplicationRecord
  belongs_to :work
  belongs_to :ci_pai
end
