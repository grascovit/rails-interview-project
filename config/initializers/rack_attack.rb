class Rack::Attack
  Rack::Attack.cache.store = ActiveSupport::Cache::MemoryStore.new

  # TODO: after the limit, switch to 1 request per 10 seconds
  throttle('tenant_request', limit: 100, period: 1.day) do |request|
    request.env['HTTP_AUTHORIZATION'] if request.path.start_with?('/api/')
  end
end
