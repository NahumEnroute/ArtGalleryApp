require 'faraday_middleware'

Her::API.setup url: ENV['API_HOST'], request: { timeout: 10, open_timeout: 2 } do |c|
  # Request
  c.use Faraday::Request::UrlEncoded

  # Response
  c.use Her::Middleware::DefaultParseJSON

  # Adapter
  c.adapter Faraday.default_adapter
end
