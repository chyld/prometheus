class CreateCoursesTable < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.text :name
      t.text :description

      t.timestamps
    end
  end
end
