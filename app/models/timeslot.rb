class Timeslot < ActiveRecord::Base
	has_many :guests, :dependent => :destroy
end
