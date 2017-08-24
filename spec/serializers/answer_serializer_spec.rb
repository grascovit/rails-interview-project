require 'rails_helper'

RSpec.describe AnswerSerializer, type: :serializer do
  ANSWER_ATTRIBUTES = %i[id body created_at updated_at user].freeze

  let(:serializer) { AnswerSerializer.new(create(:answer)) }

  it 'serializes the specified attributes' do
    expect(serializer.serializable_hash.keys).to match_array(ANSWER_ATTRIBUTES)
  end
end
