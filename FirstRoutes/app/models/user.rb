# == Schema Information
#
# Table name: users
#
#  id       :integer          not null, primary key
#  username :string           not null
#

class User < ActiveRecord::Base
  validates :username, presence: true

  has_many :available_contacts,
    through: :contact_shares,
    source: :contact

  has_many :contacts

  has_many :contact_shares
end
