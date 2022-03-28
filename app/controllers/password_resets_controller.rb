class PasswordResetsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:email])

    if @user.present?
      # Send email using ActionMailer, rails g mailer Password reset
      # .deliver_later will wait some second before send it, this will give priority to process the request and present a answer quicklier to the user
      # .deliver_now will send the email immediately, but it will make the request process a little bit slower
      PasswordMailer.with(user: @user).reset.deliver_later
    end

    redirect_to root_path, notice: "If an account with that email was found, we have sent a link to reset your password."
  end

  def edit
    @user = User.find_signed!(params[:token], purpose: "password_reset")

    # The following code will allow us to interact with the "rails s" console and call the variables available until this moment
    # binding.irb

    rescue ActiveSupport::MessageVerifier::InvalidSignature
      redirect_to sign_in_path, alert: "Your token has expired. Please try again."
  end

  def update
    @user = User.find_signed!(params[:token], purpose: "password_reset")

    if @user.update(password_params)
      redirect_to sign_in_path, notice: "Your password was successfully. Please sign in."
    else
      render :edit
    end
  end

  
  private

    def password_params
      params.require(:user).permit(:password, :password_confirmation)
    end
end