class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :content
      t.integer :user_id
      t.string :user_name
      t.string :user_pic

      t.timestamps null: false
    end
  end
end
