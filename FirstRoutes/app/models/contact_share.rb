# == Schema Information
#
# Table name: contact_shares
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  contact_id :integer
#

class ContactShare < ActiveRecord::Base
  validates :contact_id, :user_id, presence: true

  belongs_to :user, dependent: :destroy

  belongs_to :contact
end
