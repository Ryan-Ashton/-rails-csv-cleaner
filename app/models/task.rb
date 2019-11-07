class Task < ApplicationRecord
  belongs_to :user
  # belongs_to :algorithm
  mount_uploader :file, FileUploader
  validates :file, file_size: { less_than_or_equal_to: 2.megabytes, message: 'should be less or equal than %{count}'  },
                   file_content_type: { allow: 'text/csv', mode: :relaxed  }
end
