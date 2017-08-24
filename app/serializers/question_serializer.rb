class QuestionSerializer < ActiveModel::Serializer
  belongs_to :user
  has_many :answers

  attributes :id, :title, :private, :created_at, :updated_at
end
