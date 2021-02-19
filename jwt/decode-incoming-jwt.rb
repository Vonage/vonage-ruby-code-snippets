require 'jwt'

SIGNATURE = ARGV[0] || ENV['SIGNATURE']

# The JWT Ruby spec requires nil and false values provided, respectively, for the two optional parameters
# See: https://github.com/jwt/ruby-jwt#algorithms-and-usage
decoded = JWT.decode(SIGNATURE, nil, false)
puts decoded