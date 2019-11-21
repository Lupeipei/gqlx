# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default("0"), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  nickname               :string
#  avatar                 :string
#  type                   :string
#  superadmin             :boolean
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable
  DEFAULT_PASSWORD = '123456'.freeze

  before_validation :ensure_password
  before_save :ensure_nickname, only: :create
  before_save :default_visitor, only: :create
  has_many :flips, dependent: :destroy
  has_many :flipped_works, class_name: Work.to_s, through: :flips
  has_many :suggestions, dependent: :destroy

  attr_writer :current_password

  def ensure_password
    self.password ||= DEFAULT_PASSWORD
  end

  def ensure_nickname
    self.nickname ||= self.email.split('@').first
  end

  def default_visitor
    self.type ||= 'Visitor'
  end

  # def password_required?
  #   new_record? || password.present? || password_confirmation.present?
  # end
end
