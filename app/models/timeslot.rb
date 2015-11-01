class Timeslot < ActiveRecord::Base

  has_many :guests, :dependent => :destroy do
    def length
      reject(&:marked_for_destruction?).length
    end
  end
  accepts_nested_attributes_for :guests, allow_destroy: true
  validates :guests, length: { maximum: 35 }

	def name_and_guest_count   
    "#{self.name} - #{self.guest_count} / 35"   
  end
end
