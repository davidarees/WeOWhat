class Payment < ActiveRecord::Base
  attr_accessible :amount, :created, :currency_id, :event_id, :purpose_id

  belongs_to :currency
  belongs_to :purpose
  belongs_to :event
  
  has_many :payers
  has_many :debtors

  has_many :users, through: :payer
  has_many :users, through: :debtors
end
