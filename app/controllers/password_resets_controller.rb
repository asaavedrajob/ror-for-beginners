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
end