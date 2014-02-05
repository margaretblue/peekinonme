json.array!(@patients) do |patient|
  json.extract! patient, :id, :name, :email, :street, :city, :zip, :phone, :condition, :checkintime
  json.url patient_url(patient, format: :json)
end
