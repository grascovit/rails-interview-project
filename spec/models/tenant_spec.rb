require 'rails_helper'

RSpec.describe Answer, type: :model do
  describe 'callbacks' do
    context '#generate_api_key' do
      it 'creates an api key before creating the tenant' do
        tenant = create(:tenant)

        expect(tenant.api_key).not_to eq(nil)
      end

      it 'creates an api key with length of 32' do
        tenant = create(:tenant)

        expect(tenant.api_key.length).to eq(32)
      end
    end
  end
end
