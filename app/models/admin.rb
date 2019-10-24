# == Schema Information
#
# Table name: admins
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  name                   :string
#  avatar                 :string
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#

class Admin < ApplicationRecord
  DEFAULT_PASSWORD = '123456'.freeze
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  before_validation :ensure_password
  before_save :ensure_name

  def ensure_password
    self.password ||= DEFAULT_PASSWORD
  end

  def ensure_name
    self.name ||= self.email.split('@').first
  end
end
