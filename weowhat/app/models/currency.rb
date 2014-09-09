class Currency < ActiveRecord::Base
  attr_accessible :exchange_rate, :iso_code
end
