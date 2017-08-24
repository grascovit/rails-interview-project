class Rack::Attack
  Rack::Attack.cache.store = ActiveSupport::Cache::MemoryStore.new

  # TODO: after the limit, switch to 1 request per 10 seconds
  throttle('tenant_request', limit: 100, period: 1.day) do |request|
    request.env['HTTP_AUTHORIZATION'] if request.path.start_with?('/api/')
  end

  self.throttled_response = ->(env) {
    retry_after = (env['rack.attack.match_data'] || {})[:period]

    [
      429,
      {'Content-Type': 'application/json', 'Retry-After': retry_after.to_s},
      [{ error: 'Retry later' }.to_json]
    ]
  }
end
