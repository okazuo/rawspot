class Order < ApplicationRecord
  belongs_to :user
  has_one :spot

  validate :required_either_customer_or_not_tradeable

  private

  def required_either_customer_or_not_tradeable
    # customerかnot_tradeableのどちらかの値があれば true 、共にあればfalse
    if customer.present? ^ not_tradeable.present?
      return  
    end
    errors.add(:base, 'お客様名を入力してください')
  end
end