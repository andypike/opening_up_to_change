class SmsNotifier
  include SelfRegisteringNotifier

  send_notifications_via :sms

  def deliver(user, content)
    puts "** Sent #{content} notification via SMS to #{user.mobile} **"
      .light_white.on_red
  end
end
