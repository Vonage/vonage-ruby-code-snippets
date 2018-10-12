require 'json'
require 'sinatra'

get '/ncco' do
  content_type :json
  [
    {
      "action": "talk",
      "text": "Please enter three digits"
    },
    {
      "action": "input",
      "timeOut": 20,
      "maxDigits": 3,
      "eventUrl": ["#{base_url}/ivr"]
    }
  ].to_json
end

post '/event' do
  puts JSON.parse(request.body.read)
end

post '/ivr' do
  puts JSON.parse(request.body.read)
end

def base_url
  @base_url ||= "#{url_scheme}://#{http_host}"
end

def url_scheme
  request.env['rack.url_scheme']
end

def http_host
  request.env['HTTP_HOST']
end