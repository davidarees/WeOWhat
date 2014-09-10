class Purpose < ActiveRecord::Base
  attr_accessible :no_times_used, :purpose_text
  has_many :payments
end
