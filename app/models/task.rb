class Task < ApplicationRecord
  belongs_to :user
  belongs_to :algorithm
  has_one_attached :file
  validates :file, presence: true, blob: { content_type: ['text/csv', 'application/vnd.ms-excel'], size_range: 1..10.megabytes }

end
