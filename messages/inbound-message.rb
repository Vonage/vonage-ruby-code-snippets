require 'sinatra'
require 'json'

post "/webhooks/messages/inbound" do
  puts "Received inbound message webhook:\n\n"
  p JSON.parse(request.body.read)
  status 200
end

set :port, 3000