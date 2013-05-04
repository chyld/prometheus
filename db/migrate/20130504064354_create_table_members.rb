class CreateTableMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.text :email
      t.integer :user_id

      t.timestamps
    end
  end
end
