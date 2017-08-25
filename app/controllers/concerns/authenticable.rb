module Authenticable
  include ActionController::HttpAuthentication::Token::ControllerMethods

  def authenticate_tenant
    authenticate_key || render_unauthorized
  end

  private

  def authenticate_key
    authenticate_with_http_token do |api_key|
      tenant = Tenant.find_by(api_key: api_key)

      if tenant
        tenant.increment!(:requests_count)

        ActiveSupport::SecurityUtils.secure_compare(
          Digest::SHA256.hexdigest(api_key),
          Digest::SHA256.hexdigest(tenant.api_key)
        )

        return tenant
      end
    end
  end

  def render_unauthorized
    head :unauthorized
  end
end
