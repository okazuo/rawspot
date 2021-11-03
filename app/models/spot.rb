class Spot < ApplicationRecord
  with_options numericality:{other_than: 1, message:"can't be blank"} do
    validates :contact_id
    validates :water_id
    validates :officialmap_id
    validates :transcript_id
  end
 
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :contact
  belongs_to :officialmap
  belongs_to :transcript
  belongs_to :water
end
