require 'rails_helper'

RSpec.describe QuestionSerializer, type: :serializer do
  QUESTION_ATTRIBUTES = %i[id title private created_at updated_at user answers].freeze

  let(:serializer) { QuestionSerializer.new(create(:question)) }

  it 'serializes the specified attributes' do
    expect(serializer.serializable_hash.keys).to match_array(QUESTION_ATTRIBUTES)
  end
end
