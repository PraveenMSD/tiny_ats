class Job < ApplicationRecord
  belongs_to :user
  has_many :candidates

  validates :title, presence: true
  validates :openings, presence: true
  validates :experience, presence: true
end
