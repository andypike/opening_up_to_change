class NotifyAllTheThings
  include SelfRegisteringNotifier

  send_notifications_via :all

  def deliver(user, content)
    notifiers.each do |notifier|
      notifier.new.deliver(user, content)
    end
  end

  def notifiers
    NotifierRegistry.notifiers.reject { |n| n == self.class }
  end
end
