class CreateCoursesCurriculaTable < ActiveRecord::Migration
  def change
    create_table :courses_curricula, :id => false do |t|
      t.integer :course_id
      t.integer :curriculum_id
    end
  end
end
