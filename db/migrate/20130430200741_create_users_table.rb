class CreateUsersTable < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.text :email
      t.text :password_digest
      t.integer :plan_id
      t.integer :group_size
      t.text :customer_id

      t.timestamps
    end
  end
end
