APNS.host = 'gateway.push.apple.com'
APNS.port = 2195
APNS.pem = Rails.root.join('cert.pem')
APNS.pass = ENV['APNS_PASS']
