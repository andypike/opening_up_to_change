class NotifierRegistry
  @registry = {}
  @loaded   = false

  def self.register(notifier)
    @registry[notifier.notification_method] = notifier
  end

  def self.notifier_for(notification_method)
    ensure_loaded

    @registry.fetch(notification_method.to_sym) { EmailNotifier }
  end

  def self.methods
    ensure_loaded

    @registry.keys.map(&:to_s)
  end

  def self.notifiers
    ensure_loaded

    @registry.values
  end

  def self.ensure_loaded
    return if already_loaded?

    notifiers_path = File.join(Rails.root, "app", "notifiers")
    Dir["#{notifiers_path}/*.rb"].each { |file| require_dependency(file) }

    loaded!
  end

  def self.already_loaded?
    loaded? || Rails.configuration.eager_load
  end

  def self.loaded?
    @loaded
  end

  def self.loaded!
    @loaded = true
  end
end
