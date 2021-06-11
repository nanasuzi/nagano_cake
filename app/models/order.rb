class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details, dependent: :destroy

  enum method_of_payment:{
     クレジットカード: 0, #クレジットカード
     銀行振込: 1, #銀行振り込み
  }
  enum order_status:{
    入金待ち: 0,
    入金確認: 1,
    製作中: 2,
    発送準備中: 3,
    発送済み: 4,
  }

  validates :postal_code, presence: true, length: { is:7 }
  validates :address, presence: true
  validates :name, presence: true

end
