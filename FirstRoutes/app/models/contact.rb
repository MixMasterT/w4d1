# == Schema Information
#
# Table name: contacts
#
#  id      :integer          not null, primary key
#  name    :string           not null
#  email   :string           not null
#  user_id :integer          not null
#

class Contact < ActiveRecord::Base
  validates :name, :user_id, presence: true
  validates :email, presence: true, uniqueness: { scope: :user_id }

  has_many :contact_shares, dependent: :destroy

  belongs_to :owner,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User
end
