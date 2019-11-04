class Session < ApplicationRecord
  belongs_to :user
  belongs_to :algorithm
end
