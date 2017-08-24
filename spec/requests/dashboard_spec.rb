require 'rails_helper'

RSpec.describe 'Dashboard', type: :request do
  describe 'GET #index' do
    it 'returns ok http status' do
      get root_url

      expect(response).to have_http_status(:ok)
    end
  end
end
