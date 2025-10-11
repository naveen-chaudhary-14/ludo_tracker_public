class Player < ApplicationRecord
  has_many :matches
  scope :by_rank, -> { order("total_win DESC, points ASC") }
end
