class SubscriptionNotifier < ActionMailer::Base
  default from: 'j.way.rails@gmail.com'

  def notify(email)
    @email = email

    mail to: @email, subject: 'Новые статьи на ... ?'
  end
end
