class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.text :goal
      t.date :date
      t.references :user

      t.timestamps
    end
    add_index :goals, :user_id
  end
end
