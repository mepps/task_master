class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.text :what
      t.text :where
      t.text :how
      t.references :goal

      t.timestamps
    end
    add_index :tasks, :goal_id
  end
end
