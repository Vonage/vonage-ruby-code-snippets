require 'net/https'
require 'json'
require 'nexmo'

NEXMO_PRIVATE_KEY = File.read(ENV['NEXMO_PRIVATE_KEY'])
NEXMO_APPLICATION_ID = ENV['NEXMO_APPLICATION_ID']
CONV_UUID = ENV['CONV_UUID']
BASE_URL = 'https://example.com'
claims = { application_id: NEXMO_APPLICATION_ID }
token = Nexmo::JWT.generate(claims, NEXMO_PRIVATE_KEY)

begin
    uri = URI("https://api.nexmo.com/v1/conversations/#{CONV_UUID}/record")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    req = Net::HTTP::Put.new(uri.path, {
      'Content-Type' =>'application/json',  
      'Authorization' => "Bearer #{token}"
    })
    req.body = {
      'action' => 'start',
      'event_url' => ["#{BASE_URL}/webhook/event"],
      'event_method' => 'POST',
      'split' => 'conversation',
      'format' => 'mp3'
    }.to_json
    res = http.request(req)
    res.code == '204' ? return_msg = "Successful HTTP Status #{res.code}" : return_msg = "Response #{res.code}: #{res.body}" 
    puts return_msg
    puts JSON.parse(res.body) unless res.code == '204'
rescue => e
    puts "failed #{e}"
end