class CreateCurriculaTable < ActiveRecord::Migration
  def change
    create_table :curricula do |t|
      t.text :name
      t.text :description

      t.timestamps
    end
  end
end
