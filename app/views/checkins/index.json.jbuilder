json.array!(@checkins) do |checkin|
  json.extract! checkin, :id, :patient_id, :message
  json.url checkin_url(checkin, format: :json)
end
