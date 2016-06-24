class DeleteUserMailer < ActionMailer::Base
  default from: "from@example.com"
  layout 'delete user mailer'

  def goodbye_email(user)
  	@user = user@url = 'http://example.com/login'
  	mail(to: @user.email, subject: 'Sorry to see you go')
  end
end

