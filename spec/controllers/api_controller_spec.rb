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
          request.headers['Authorization'] = "Token token=#{tenant.api_key}"

          expect(controller.authenticate_tenant).to eq(tenant)
        end
      end

      context 'when api key is not valid' do
        it 'returns unauthorized http status' do
          get :index # fake controller index request

          expect(response).to have_http_status(:unauthorized)
        end
      end
    end
  end
end
