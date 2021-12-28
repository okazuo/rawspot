class Order < ApplicationRecord
  belongs_to :user
  belongs_to :spot

  validates :customer, presence: true
end