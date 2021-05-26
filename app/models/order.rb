class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details, dependent: :destroy

  enum method_of_payment:{
     credit: 0, #クレジットカード
     bank: 1, #銀行振り込み
  }
  enum order_status:{
    waiting_for_payment: 0, #入金待ち
    payment_confirmation: 1, #入金確認
    production: 2, #制作中
    preparing_to_ship: 3, #発送準備中
    sent: 4, #発送済み
  }

end
