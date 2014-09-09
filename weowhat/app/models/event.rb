class Event < ActiveRecord::Base
  attr_accessible :active, :base_currency_id, :description, :end_time, :fb_id, :fb_owner, :fb_time_zone, :location, :name, :start_time, :user_id
end
