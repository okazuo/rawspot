class Spot < ApplicationRecord

  with_options presence: true do
    validates :estate_agent, length: { maximum: 50 }
    validates :address, length: { maximum: 50 }
  end

  validates :size, numericality: true, allow_blank: true, length: { maximum: 4 }
  validates :price, numericality: true, allow_blank: true, length: { maximum: 5 }
  validates :images, length: {maximum: 5, massage: 'は5枚以下にしてください'}
  validates :explanation, length: { maximum: 1000 }
  validate :faxdate_file_type

  def faxdate_file_type
    if faxdate.present?
      if !faxdate.content_type.in?(%(application/pdf))
        errors.add(:faxdate, 'はpdf形式にしてください')
      end
    end
  end

  with_options numericality: { other_than: 1, message: "を選択してください" } do
    validates :water_id
    validates :officialmap_id
    validates :transcript_id
    validates :contact_id
  end


  belongs_to :user
  has_many_attached :images
  has_one :order
  has_one :close
  has_many :comments
  has_one_attached :faxdate
  # 中間テーブル
  has_many :favorites, dependent: :destroy
  has_many :users, through: :favorites

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :contact
  belongs_to :officialmap
  belongs_to :transcript
  belongs_to :water

end
