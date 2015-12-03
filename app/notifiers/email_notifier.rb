class EmailNotifier
  include SelfRegisteringNotifier

  send_notifications_via :email

  def deliver(user, content)
    puts "** Sent #{content} notification via EMAIL to #{user.email} **"
      .light_white.on_magenta
  end
end
