class CreateJoinTable < ActiveRecord::Migration
  def change
    create_join_table :users, :events do |t|
      t.index :user_id
      t.index :event_id
    end
  end
end
