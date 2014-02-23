class PushNotifier
  include Mongoid::Document

  def self.new_notification(device_token, options = {})
    APNS::Notification.new(device_token, options)
  end

  def self.notify_users(users, options = {})
    users ||= []
    notifications = []
    users.each do |u|
      if u.device_token
        notification = PushNotifier.new_notification(u.device_token, options)
        notifications << notification
        puts "Preparing Notification: " + notification.inspect
      else
        puts "No Notification: no device token"
      end
    end
    puts "Sending #{notifications.count} Notifications"
    APNS.send_notifications(notifications)
  end

  def self.notify_nearby_users_with_tag(coordinates, tags)
    users = User.nearby_users_with_tag(coordinates, tag)
    PushNotifier.notify_users(users)
  end
end
