class SessionsController < ApplicationController
	def new
	end

	def create
		find_user = User.where(email_address: params[:email_address])
		@current_user = find_user[0]
		unless @current_user == nil
			if @current_user.authenticate(params[:password])
				session[:logged_in] = true
				session[:user_id] = @current_user.id
				current_goal = @current_user.goals.where("date = '#{Date.today}'").first
				session[:current_goal_id] = current_goal.id unless current_goal == nil
				redirect_to @current_user
			else
				redirect_to new_session_path, alert: "Either email address or password is incorrect."
			end
		else
		redirect_to new_session_path, alert: "User not found."
		end
	end

	def destroy
		reset_session
		redirect_to new_session_path
	end
end
