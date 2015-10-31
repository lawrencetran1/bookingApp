json.array!(@timeslots) do |timeslot|
  json.extract! timeslot, :id, :name
  json.url timeslot_url(timeslot, format: :json)
end
