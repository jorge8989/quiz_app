json.array!(@personalities) do |personality|
  json.extract! personality, :id, :name, :description
  json.url personality_url(personality, format: :json)
end
