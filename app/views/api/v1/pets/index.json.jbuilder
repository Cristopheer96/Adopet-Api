json.array! @pets do |pet|
  json.extract! pet, :gender, :name, :age, :coatsize
end
