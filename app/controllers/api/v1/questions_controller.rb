class Api::V1::QuestionsController < ApplicationController
  def index
    @questions = Question.includes(:user, :answers, answers: :user).public_only

    render json: @questions,
           include: [:user, :answers, answers: :user],
           status: :ok
  end
end
