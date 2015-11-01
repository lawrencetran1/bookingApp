class Guest < ActiveRecord::Base
  belongs_to :timeslot

  def name_and_guest_count   
    "#{self.name} - #{self.guest_count}"   
  end

end
