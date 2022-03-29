class OmniauthCallbacksController < ApplicationController
  def twitter
    Rails.logger.info "\n------## Rails.logger.info ##------"
    Rails.logger.info auth
    Rails.logger.info "------#######################------\n"

    twitter_account = Current.user.twitter_accounts.where(username: auth.info.nickname).first_or_initialize
    twitter_account.update(
        name: auth.info.name,
        username: auth.info.nickname,
        image: auth.info.image,
        token: auth.credentials.token,
        secret: auth.credentials.secret
      )

    redirect_to root_path, notice: "Your twitter account @#{auth.info.nickname} was successfully connected"
  end


  private

    def auth
      request.env['omniauth.auth']
    end
end