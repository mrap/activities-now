# APNS.host = 'gateway.push.apple.com' # production only
APNS.port = 2195
APNS.pem = Rails.root.join('cert.pem')
APNS.pass = ENV['APNS_PASS']
