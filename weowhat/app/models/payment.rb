class Payment < ActiveRecord::Base
  attr_accessible :amount, :created, :currency_id, :event_id, :purpose_id
end
