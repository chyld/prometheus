class CreateUnitsTable < ActiveRecord::Migration
  def change
    create_table :units do |t|
      t.text :name
      t.text :description
      t.integer :section_id

      t.timestamps
    end
  end
end
