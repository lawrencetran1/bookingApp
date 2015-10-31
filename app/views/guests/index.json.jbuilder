json.array!(@guests) do |guest|
  json.extract! guest, :id, :first_name, :last_name, :email, :plus_one, :timeslot_id
  json.url guest_url(guest, format: :json)
end
