json.array!(@patients) do |patient|
  json.extract! patient, :id, :name, :phone, :street, :city, :zip, :condition, :checkintime
  json.url patient_url(patient, format: :json)
end
