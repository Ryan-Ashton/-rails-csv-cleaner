class Task < ApplicationRecord
  belongs_to :user
  belongs_to :algorithm
  mount_uploader :file, FileUploader
end
