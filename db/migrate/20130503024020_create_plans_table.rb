class CreatePlansTable < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.text :name
      t.text :timeframe
      t.decimal :amount

      t.timestamps
    end
  end
end
