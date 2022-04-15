require 'faraday_middleware'

class CustomParser < Faraday::Response::Middleware
  def on_complete(env)
    json = MultiJson.load(env.body.to_json, symbolize_keys: true)
    env[:body] = {
      errors: json[:errors],
      metadata: json[:metadata]
    }
    env[:body][:data] = json[:data][:data]
    # env[:body][json[:data][:type].to_sym] = json[:data][:data]
    env
  end
end

Her::API.setup url: ENV['API_HOST'], request: { timeout: 10, open_timeout: 2 } do |c|
  # Request
  c.use CustomParser

  # Response
  c.use Her::Middleware::DefaultParseJSON

  # Adapter
  c.adapter Faraday.default_adapter
end
