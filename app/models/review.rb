class Review < ApplicationRecord
  belongs_to :cocktail

  validates :comment, presence: true
  RATING = [1, 2, 3, 4, 5]
  validates :rating, inclusion: {
    in: RATING,
    message: "must be between 1 and 5"
  }

  def stars_as_percent
    (rating / 5.0) * 100.0
  end
end
