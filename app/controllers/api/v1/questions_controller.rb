class Api::V1::QuestionsController < ApplicationController
  def index
    @questions = Question.public_only

    render json: @questions, status: :ok
  end
end
