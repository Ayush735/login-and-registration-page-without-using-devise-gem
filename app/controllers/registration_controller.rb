class RegistrationController < ApplicationController  
  
  def new
    @user = User.new()
  end

  def create
    @user = User.create(user_params)
    if @user.save
      flash[:notice] = 'You signed up successfully..!! please login'
      redirect_to new_session_path
    else 
      flash[:alert] = @user.errors.full_messages.join(', ')
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end