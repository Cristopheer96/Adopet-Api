json.array! @pets do |pet|
  json.extract! pet, :gender, :name, :address
end
