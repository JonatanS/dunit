class Administration < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.administration.invite.subject
  #
  def invite user
    @greeting = "You have been invited to a project."
    @user = user

    mail to: user.email, subject: "Cool thing:"
  end
end
