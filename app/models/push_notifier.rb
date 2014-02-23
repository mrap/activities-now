class PushNotifier
  include Mongoid::Document

  def self.new_notification(device_token, options = {})
    APNS::Notification.new(device_token, options)
  end

  def self.notify_users(users = [])
    notifications = []
    users.each do |u|
      notifications << PushNotifier.new_notification(u.device_token) if u.device_token
    end
    APNS.send_notifications(notifications)
  end

end
