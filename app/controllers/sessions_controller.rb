class SessionsController < ApplicationController
	def new
	end

	def create
		user = User.where(name: params[:signin][:name]).first

		if user && user.authenticate(params[:signin][:password])
	
			session[:user_id] = user.id
			flash[:notice] = 'Signed in successfully.'

			redirect_to root_url
		else
			flash[:error] = 'Sorry.'
			render :new
		end
	end

	def destroy
		@_current_user = session[:user_id] = nil
		flash[:notice] = 'Signed out successfully.'

		redirect_to root_url
	end

	private

	def current_user
		@_current_user ||= session[:user_id] && User.find_by(id: session[:user_id])
	end
end
