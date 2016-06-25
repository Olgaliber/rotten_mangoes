class DeleteUserMailer < ActionMailer::Base
  default from: "from@example.com"
  layout 'goodbye_email'

  def goodbye_email(user)
  	@user = user
  	@url = 'http://example.com/login'
  	mail(to: @user.email, subject: 'Your account has been deleted')
  end
end

