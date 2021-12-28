class Close < ApplicationRecord
  belongs_to :user
  has_one :spot

  validates :not_available, presence: true
end
