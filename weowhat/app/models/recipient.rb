class Recipient < ActiveRecord::Base
  attr_accessible :payment_id, :user_id, :weighting
end
