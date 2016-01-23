json.array!(@quiz_options) do |quiz_option|
  json.extract! quiz_option, :id, :content
  json.url quiz_option_url(quiz_option, format: :json)
end
