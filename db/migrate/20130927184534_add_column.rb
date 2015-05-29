class AddColumn < ActiveRecord::Migration
	def change
		add_column :tasks, :done, :integer
	end
end
