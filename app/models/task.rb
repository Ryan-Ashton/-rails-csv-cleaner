class Task < ApplicationRecord
  belongs_to :user
  belongs_to :algorithm
  has_one_attached :file
  # validates :file, presence: true,  content_type: ['text/csv', "application/vnd.ms-excel"], size_range: 1..5.megabytes

end
