class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :weekend_date
      t.integer :sat_votes
      t.integer :sun_votes
      t.integer :final_date

      t.timestamps null: false
    end
  end
end
