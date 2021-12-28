class Order < ApplicationRecord
  belongs_to :user
  has_one :spot

  validates :customer, presence: true
end