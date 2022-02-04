class Close < ApplicationRecord
  validates_uniqueness_of :spot_id, scope: :user_id

  belongs_to :user
  belongs_to :spot
end