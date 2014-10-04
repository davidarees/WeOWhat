class Payment < ActiveRecord::Base
  attr_accessible :amount, :date_paid, :currency_id, :event_id, :reason, :user_id

  belongs_to :currency
  # belongs_to :purpose
  belongs_to :event

    
  # has_many :payers
  # has_many :debtors

  # has_many :users, through: :payer
  # has_many :users, through: :debtors
end
