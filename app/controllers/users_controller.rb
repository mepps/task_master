class UsersController < ApplicationController
layout :resolve_layout



	def new
		@user = User.new
	end

	def show
		if session[:logged_in]
			@goals = User.find(session[:user_id]).goals.where("date >= '#{Date.today}'")
			
		else 
			redirect_to new_session_path
		end
	end

	def create
		@user = User.new(first_name: params[:first_name], last_name: params[:last_name], email_address: params[:email_address], long_term_goal: params[:long_term_goal], password: params[:password])
		if @user.save
			redirect_to @user
		else
			redirect_to new_user_path, alert: @user.errors.full_messages.each {|message| message}
		end	
	end
     private 
     def resolve_layout
       case action_name
         when "show"
          "goals"
         else 
          "application"
         end
      end		
end
