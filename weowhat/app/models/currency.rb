class Currency < ActiveRecord::Base
  attr_accessible :exchange_rate, :iso_code

  has_many :payments
end
