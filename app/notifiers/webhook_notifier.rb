class WebhookNotifier
  include SelfRegisteringNotifier

  send_notifications_via :webhook

  def deliver(user, content)
    puts "** Sent #{content} notification via WEBHOOK to #{user.url} **"
      .light_white.on_blue
  end
end
