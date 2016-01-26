json.(@quiz, :id, :name, :description, :created_at, :updated_at)
json.pesonalities do 
  json.array!(@quiz.personalities) do |personality|
    json.(personality, :name, :description, :low_range, :high_range, :id)
  end
end
