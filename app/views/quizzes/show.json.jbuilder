json.(@quiz, :id, :name, :description, :created_at, :updated_at)
json.personalities do 
  json.array!(@quiz.personalities) do |personality|
    json.(personality, :name, :description, :low_range, :high_range, :id, :image_med_url)
  end
end
