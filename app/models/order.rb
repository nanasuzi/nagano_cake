class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details, dependent: :destroy

  enum method_of_payment:{
     クレジットカード: 0, #クレジットカード
     銀行振込: 1, #銀行振り込み
  }
  enum order_status:{
    入金待ち: 0, #入金待ち
    入金確認: 1, #入金確認
    制作中: 2, #制作中
    発送準備中: 3, #発送準備中
    発送済み: 4, #発送済み
  }

end
