json.array!(@qnas) do |qna|
  json.extract! qna, :id, :question, :answer
  json.url qna_url(qna, format: :json)
end
