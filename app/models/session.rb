class Session < ApplicationRecord
  belongs_to :user
  belongs_to :algorithm
  mount_uploader :file, FileUploader

  # after_create :convert

  # def convert
  #   csv_url = file.url
  #   # call a conversion service object
  # end
end
