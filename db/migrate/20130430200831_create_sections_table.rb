class CreateSectionsTable < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.text :name
      t.text :description

      t.timestamps
    end
  end
end
