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
		@user = User.new(params['user'])
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
