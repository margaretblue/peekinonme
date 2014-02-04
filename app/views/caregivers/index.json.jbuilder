json.array!(@caregivers) do |caregiver|
  json.extract! caregiver, :id, :name, :phone, :email
  json.url caregiver_url(caregiver, format: :json)
end
