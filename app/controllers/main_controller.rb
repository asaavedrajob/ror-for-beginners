class MainController < ApplicationController
  def index
    # This flash msg will persists 2 requests
    # flash[:notice] = "Logged in successfully"
    
    # This flash msg will persists only 1 request
    # flash.now[:alert] = "Invalid email or password"

    if session[:user_id]
      @user = User.find_by(id: session[:user_id])
    end
  end
end