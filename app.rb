require 'alexa_rubykit'
require 'sinatra'
require 'json'

before do
  content_type('application/json')
end

get '/' do
  'Hello World!'
end

post '/' do
  alexa = AlexaRubykit.build_request(JSON.parse(request.body.read.to_s))
  alexa_response = AlexaRubykit::Response.new

  slots = alexa.slots

  speach_string = ''

  if alexa.type == 'INTENT_REQUEST'
    alexa_response.add_speech(speach_string)
    alexa_response.add_hash_card(title: 'Travis CI', subtitle: 'Build Status')
  end

  if alexa.type == 'SESSION_ENDED_REQUEST'
    halt 200
  end

  alexa_response.build_response
end
