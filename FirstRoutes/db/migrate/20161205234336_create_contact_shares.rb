class CreateContactShares < ActiveRecord::Migration
  def change
    create_table :contact_shares do |t|
      t.integer :user_id, index: true, foreign_key: true
      t.integer :contact_id, index: true, foreign_key: true
    end
  end
end
