json.array!(@user_results) do |user_result|
  json.extract! user_result, :id, :points
  json.url user_result_url(user_result, format: :json)
end
