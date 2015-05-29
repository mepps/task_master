class GoalsController < ApplicationController
	def index
		if session[:logged_in]
			@goals = User.find(session[:user_id]).goals#.where("date >= '#{Date.today}'")
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
		if params[:date] == ""
			if maxdate = User.find(session[:user_id]).goals.maximum('date') && maxdate != nil
				@goal.date = maxdate + 1
			else
				@goal.date = Time.now.to_s
			end
		else
			@goal.date = params[:date]
    end
		respond_to do |format|
			format.html{redirect_to goals_path}
			format.js
		end
		if @goal.save
			respond_to do |format|
				format.html{redirect_to goals_path}
				format.js
			end
		# end	
		else 
			redirect_back flash[:alert] == 'error'
		end	
	end

	def no_goal
	end

	def get_goal
		@goal = Goal.where("date = ? AND user_id = ?",  params[:date], session[:user_id]).first
		date = params[:date].split("-")
		@date = "#{date[1]}/#{date[2]}/#{date[0]}"
			respond_to do |format|
				format.html{redirect_to "/users/#{session[:user_id]}"}
				format.js
			end

	end

	def destroy
		@goal = Goal.find(params[:id])
		@goal.destroy
		respond_to do |format|
			format.html {redirect_to "/goals/#{session[:current_goal_id]}"}
			format.js
		end
	end

end
