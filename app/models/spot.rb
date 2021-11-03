class Spot < ApplicationRecord

  with_options presence: true do
    validates :estate_agent
    validates :address
  end

  validates :size, numericality: true, allow_blank: true
  validates :price, numericality: true, allow_blank: true

  with_options numericality:{other_than: 1, message:"can't be blank"} do
    validates :water_id
    validates :officialmap_id
    validates :transcript_id
    validates :contact_id
  end
 

  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :contact
  belongs_to :officialmap
  belongs_to :transcript
  belongs_to :water
end
