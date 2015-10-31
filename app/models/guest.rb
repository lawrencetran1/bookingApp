class Guest < ActiveRecord::Base
  belongs_to :timeslot
end
