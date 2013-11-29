class UsersController < ApplicationController
  def new
		@user = User.new
  end

  def create
		@user = User.new(user_params)

		if @user.save
			flash[:notice] = 'You have signed up successfully.'
			redirect_to projects_path
		else
			render :new
		end
  end

  def show
		@user = User.find(params[:id])
  end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])

		if @user.save
			flash[:notice] = 'Profile has been updated.'

			redirect_to user_path(@user)
		else
			flash[:alert] = 'You profile cannot be updated.'

			render 'edit'
		end
	end

	private

	def user_params
		params.require(:user).permit(:name, :password, :password_confirmation)
	end
end
