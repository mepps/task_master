class GoalsController < ApplicationController
	def index
		if session[:logged_in]
			@goals = User.find(session[:user_id]).goals.where("date >= '#{Date.today}'")
		else 
			redirect_to new_session_path
		end
	end
	def show
		if session[:logged_in]
			@goal = Goal.find(params[:id])
		else 
			redirect_to new_session_path
		end
	end

	def create
		@goal = User.find(session[:user_id]).goals.new(goal: params[:goal])
		@goal.date = User.find(session[:user_id]).goals.maximum('date') + 1
		@goal.save

		redirect_to goals_path
	end

	def get_goal
		@goal = Goal.where(date: params[:date]).first
		# redirect_to "/users/#{session[:user_id]}"

	end

end
