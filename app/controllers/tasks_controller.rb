class TasksController < ApplicationController
	def create
		# render text: params
		@task = Goal.find(params[:goal_id]).tasks.new(what: params[:what], where: params[:where], how: params[:how])
		if @task.save
			respond_to do |format|
			 format.html{redirect_to "/goals/#{params[:goal_id]}"}
			 format.js
			end
		end
	end

end
