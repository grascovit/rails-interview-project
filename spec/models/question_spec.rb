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

    describe '.search_by_title' do
      context 'when there is a query' do
        it 'returns the questions that contains the query' do
          desired_question = create(:question, title: 'this one is the right question')
          other_desired_question = create(:question, title: 'this one is the right question too')
          random_question = create(:question, title: 'this one is just a random question')

          expected_questions = [desired_question, other_desired_question]

          expect(Question.search_by_title('the right question')).to match_array(expected_questions)
        end
      end

      context 'when there is no query' do
        it 'returns all questions' do
          questions = create_list(:question, 3)

          expect(Question.search_by_title(nil)).to match_array(questions)
        end
      end
    end
  end

  describe 'class methods' do
    describe '.search' do
      context 'when there is a query' do
        it 'returns the questions that contains the query' do
          desired_question = create(:question, title: 'this one is the right question')
          other_desired_question = create(:question, title: 'this one is the right question too')
          random_question = create(:question, title: 'this one is just a random question')

          expected_questions = [desired_question, other_desired_question]

          expect(Question.search('the right question')).to match_array(expected_questions)
        end
      end

      context 'when there is no query' do
        it 'returns all questions' do
          questions = create_list(:question, 3)

          expect(Question.search_by_title(nil)).to match_array(questions)
        end
      end
    end
  end
end
