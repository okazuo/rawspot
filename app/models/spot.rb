class Spot < ApplicationRecord
  with_options presence: true do
    validates :estate_agent, length: { maximum: 50 }
    validates :address, length: { maximum: 50 }
  end

  validates :size, numericality: true, allow_blank: true, length: { maximum: 4 }
  validates :price, numericality: true, allow_blank: true, length: { maximum: 5 }

  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :water_id
    validates :officialmap_id
    validates :transcript_id
    validates :contact_id
  end

  validates :explanation, length: { maximum: 1000 }

  belongs_to :user
  has_one_attached :image
  has_one :order
  has_one :close

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :contact
  belongs_to :officialmap
  belongs_to :transcript
  belongs_to :water

end
