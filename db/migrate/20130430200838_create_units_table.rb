class CreateUnitsTable < ActiveRecord::Migration
  def change
    create_table :units do |t|
      t.text :name
      t.text :description

      t.timestamps
    end
  end
end
