class Question < ApplicationRecord
  has_many :answers
  belongs_to :user

  scope :public_only, -> { where(private: false) }
  scope :search_by_title, ->(query) {
    where('LOWER(title) LIKE :query', query: "%#{query.to_s.downcase}%")
  }

  def self.search(query)
    if query.present?
      search_by_title(query)
    else
      all
    end
  end
end
