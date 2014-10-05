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

	def update
		done = 1
		@task = Task.find(params[:id])
		@task.done = params[:done]
		@task.save
			respond_to do |format|
			 format.html{redirect_to "/goals/#{params[:goal_id]}"}
			 format.js
			end		
	end

	def destroy
		@goal = Goal.find(params[:goal_id])
		@task = Task.find(params[:id])
		@task.destroy
		respond_to do |format|
			format.html{redirect_to @goal}
			format.js
		end
	end


end
