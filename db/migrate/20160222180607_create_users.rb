class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :origin
      t.string :pic
      t.string :neighborhood
      t.string :bio

      t.timestamps null: false
    end
  end
end
