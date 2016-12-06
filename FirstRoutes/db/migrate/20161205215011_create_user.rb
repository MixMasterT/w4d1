class CreateUser < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :name, null: false
    end
  end
end
