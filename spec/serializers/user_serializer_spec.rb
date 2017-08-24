require 'rails_helper'

RSpec.describe UserSerializer, type: :serializer do
  USER_ATTRIBUTES = %i[id name created_at updated_at].freeze

  let(:serializer) { UserSerializer.new(create(:user)) }

  it 'serializes the specified attributes' do
    expect(serializer.serializable_hash.keys).to match_array(USER_ATTRIBUTES)
  end
end
