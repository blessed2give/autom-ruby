class CreateReferrals < ActiveRecord::Migration
  def change
    create_table :referrals do |t|
      t.string :firstName
      t.string :lastName
      t.string :email

      t.timestamps null: false
    end
  end
end
