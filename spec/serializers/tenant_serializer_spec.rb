require 'rails_helper'

RSpec.describe TenantSerializer, type: :serializer do
  TENANT_ATTRIBUTES = %i[id api_key created_at updated_at].freeze

  let(:serializer) { TenantSerializer.new(create(:tenant)) }

  it 'serializes the specified attributes' do
    expect(serializer.serializable_hash.keys).to match_array(TENANT_ATTRIBUTES)
  end
end
