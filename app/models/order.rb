class Order < ApplicationRecord
  validates :customer, presence: true

  belongs_to :user
  belongs_to :spot
end