require 'rails_helper'

RSpec.describe ApiController, type: :controller do
  describe 'Authenticable' do
    let(:tenant) { create(:tenant) }

    controller do
      include Authenticable

      def index; end
    end

    describe '#authenticate_tenant' do
      context 'when api key is valid' do
        it 'returns the tenant' do
          request.headers['Authorization'] = valid_authorization_token

          expect(controller.authenticate_tenant).to eq(tenant)
        end

        it 'increments the tenant requests count by one' do
          previous_count = tenant.requests_count

          request.headers['Authorization'] = valid_authorization_token
          controller.authenticate_tenant

          tenant.reload

          expect(tenant.requests_count).to eq(previous_count + 1)
        end
      end

      context 'when api key is not valid' do
        it 'returns unauthorized http status' do
          get :index # fake controller index request

          expect(response).to have_http_status(:unauthorized)
        end

        it 'does not increment the tenant requests count' do
          previous_count = tenant.requests_count

          get :index # fake controller index request

          tenant.reload

          expect(tenant.requests_count).to eq(previous_count)
        end
      end
    end
  end

  private

  def valid_authorization_token
    "Token token=#{tenant.api_key}"
  end
end
