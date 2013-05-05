class CreateCurriculaUsersTable < ActiveRecord::Migration
  def change
    create_table :curricula_users, :id => false do |t|
      t.integer :curriculum_id
      t.integer :user_id
    end
  end
end
