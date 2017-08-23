require 'rails_helper'

RSpec.describe 'Questions', type: :request do
  describe 'GET #index' do
    context 'when there are public and private questions' do
      let!(:public_questions) { create_list(:public_question, 2) }
      let!(:private_questions) { create_list(:private_question, 2) }

      it 'returns ok http status' do
        get api_v1_questions_url

        expect(response).to have_http_status(:ok)
      end

      it 'returns only public questions' do
        get api_v1_questions_url

        questions = JSON.parse(response.body)
        question_ids = questions.collect { |question| question['id'] }

        expect(question_ids).to match_array(public_questions.pluck(:id))
      end

      it 'does not return private questions' do
        get api_v1_questions_url

        questions = JSON.parse(response.body)
        question_ids = questions.collect { |question| question['id'] }

        expect(question_ids).not_to match_array(private_questions.pluck(:id))
      end
    end

    context 'when there are no questions' do
      it 'returns ok http status' do
        get api_v1_questions_url

        expect(response).to have_http_status(:ok)
      end

      it 'returns an empty array' do
        get api_v1_questions_url

        questions = JSON.parse(response.body)
        expect(questions).to match_array([])
      end
    end
  end
end
