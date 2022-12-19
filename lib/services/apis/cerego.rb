class Services::Apis::Cerego
  def self.connection
    @connection ||= Faraday.new do |conn|
      conn.request(
        :authorization,
        'Bearer',
        ENV["CEREGO_API_TOKEN"]
      )
    end
  end

  def self.get_suggested_distractors(question:, answer:)
    question_query = [
      question.split(' ').join("+"),
      "texts[]=#{answer}"
    ].join("&")

    url = [
      ENV["CEREGO_API_URL"],
      "suggested_distractors?question=#{question_query}"
    ].join("/")

    response = connection.get(
      url,
      {
        'Accept' => 'application/json'
      }
    )

    suggested_distractors = HashWithIndifferentAccess.new(
      JSON.parse(response.body)
    )

    suggested_distractors[:data][:attributes][:distractors]
  rescue => e
    raise StandardError.new("Cerego API error: #{e}")
  end
end
