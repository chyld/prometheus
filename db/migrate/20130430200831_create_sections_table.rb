class CreateSectionsTable < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.text :name
      t.text :description
      t.integer :course_id

      t.timestamps
    end
  end
end
