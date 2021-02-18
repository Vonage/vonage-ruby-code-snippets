require 'jwt'

SIGNATURE = ARGV[0] || ENV['SIGNATURE']

decoded = JWT.decode(SIGNATURE, nil, false)
puts decoded