class Event < ActiveRecord::Base
  attr_accessible :active, :base_currency_id, :description, :end_time, :fb_id, :fb_owner, :fb_time_zone, :location, :name, :start_time, :user_ids
  has_many :payments
  has_and_belongs_to_many :users
end
