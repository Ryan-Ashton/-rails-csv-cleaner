class Task < ApplicationRecord
  belongs_to :user
  # belongs_to :algorithm
  has_one_attached :file
  validates :file, presence: true, blob: { content_type: ['text/csv'], size_range: 1..5.megabytes }
end
