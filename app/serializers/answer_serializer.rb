class AnswerSerializer < ActiveModel::Serializer
  belongs_to :user

  attributes :id, :body, :created_at, :updated_at
end
