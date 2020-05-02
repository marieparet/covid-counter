require 'httparty'
require 'json'

response = HTTParty.get('https://api.covid19api.com/world/total', {
  timeout: 0.1,
  open_timeout: 0.1
})

if response.code == 200
  p response.body

  json = JSON.parse(response.body)
  p json
end

