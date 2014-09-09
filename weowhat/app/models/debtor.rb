class Debtor < ActiveRecord::Base
  attr_accessible :payment_id, :user_id, :weighting

  belongs_to :payment
  belongs_to :user
end
