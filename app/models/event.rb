class Event < ActiveRecord::Base
  belongs_to :client
  belongs_to :event_planner
end
