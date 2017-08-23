class Question < ApplicationRecord
  has_many :answers
  belongs_to :user

  scope :public_only, -> { where(private: false) }
end
