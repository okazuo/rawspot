class Close < ApplicationRecord
  belongs_to :user
  belongs_to :spot

  validates :not_available, presence: true
end
