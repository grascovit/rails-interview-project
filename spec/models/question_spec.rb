require 'rails_helper'

RSpec.describe Question, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:answers) }
  end

  describe 'scopes' do
    describe '.public_only' do
      context 'when there are public and private questions' do
        let(:public_question) { create(:public_question) }
        let(:private_question) { create(:private_question) }

        it 'returns only the public questions' do
          another_public_question = create(:public_question)

          expect(Question.public_only).to match_array([public_question, another_public_question])
        end

        it 'does not include the private question' do
          expect(Question.public_only).not_to include(private_question)
        end
      end

      context 'when there are no questions' do
        it 'returns empty array' do
          expect(Question.public_only).to match_array([])
        end
      end
    end
  end
end
