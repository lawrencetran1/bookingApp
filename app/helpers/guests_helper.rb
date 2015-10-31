module GuestsHelper
	def getTimeSlots
		Timeslot.where('guest_count < 35')
	end
end
