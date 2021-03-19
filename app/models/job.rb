class Job < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :openings, presence: true
  validates :experience, presence: true
end
