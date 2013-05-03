class CreateUsersTable < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.text :email
      t.text :password_digest
      t.integer :plan_id
      t.date :plan_start
      t.text :customer_id

      t.timestamps
    end
  end
end
