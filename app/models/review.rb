class Review < ApplicationRecord
  belongs_to :restaurant
  validates :content, presence: true
  validates_inclusion_of :rating, :in => 0..5
  validates_numericality_of :rating, only_integer: true
end
