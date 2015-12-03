module SelfRegisteringNotifier
  def self.included(base)
    base.send(:extend, ClassMethods)
  end

  module ClassMethods
    attr_accessor :notification_method

    def send_notifications_via(notification_method)
      self.notification_method = notification_method

      NotifierRegistry.register(self)
    end
  end
end
