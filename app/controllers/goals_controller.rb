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
		if User.find(session[:user_id]).goals.maximum('date')
			@goal.date = User.find(session[:user_id]).goals.maximum('date') + 1
		else
			@goal.date = Date.today
		end
		@goal.save

		respond_to do |format|
			format.html{redirect_to goals_path}
			format.js
		end
		
	end

	def get_goal
		@goal = Goal.where("date = ? AND user_id = ?",  params[:date], session[:user_id]).first
		@date = params[:date]
		# redirect_to "/users/#{session[:user_id]}"

	end

end
