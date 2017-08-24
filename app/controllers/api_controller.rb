class ApiController < ActionController::API
  include Authenticable

  before_action :authenticate_tenant
end