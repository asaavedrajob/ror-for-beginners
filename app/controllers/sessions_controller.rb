class SessionsController < ApplicationController
  def destroy
    session.delete(:user_id)
    redirect_to root_path, notice: "Logged out"
  end

  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user.present? and user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: "Logged in successfully"
    else
      flash[:alert] = "Invalid email or password"
      render :new
    end
  end
end