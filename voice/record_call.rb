require 'json'
require 'sinatra'

get '/ncco' do
  content_type :json
  [
    {
      "action": "talk",
      "text": "Please leave a message after the tone, then press #. We will get back to you as soon as we can",
      "voiceName": "Emma"
    },
    {
      "action": "record",
      "eventUrl": [
          "#{base_url}/voicemails"
      ],
      "endOnSilence": "3",
      "endOnKey" => "#",
      "beepStart": "true"
    },
    {
      "action": "talk",
      "text": "Thank you for your message. Goodbye"
    }
  ].to_json
end

post '/voicemails' do
  puts JSON.parse(request.body.read)
end

post '/event' do
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