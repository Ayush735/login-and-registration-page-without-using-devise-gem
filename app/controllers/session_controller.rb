class SessionController < ApplicationController

  def new
  end  
  
  def login
    authorized_user = User.authenticate(params[:email],params[:password])
    if authorized_user
      session[:user_id] = authorized_user.id
      flash[:notice] = "Logged in as #{authorized_user.name}"
      redirect_to user_path(authorized_user)
    else
      flash[:notice] = "Invalid Username or Password"
      render :new
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to new_session_path, notice: "Logout Successfully..!!"
  end

end