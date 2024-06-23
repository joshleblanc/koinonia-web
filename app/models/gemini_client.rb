class GeminiClient 
    def self.instance 
        @instance ||= Gemini.new(
            credentials: {
              service: 'generative-language-api',
              api_key: Rails.application.credentials[:google][:key]
            },
            options: { model: 'gemini-1.5-flash', server_sent_events: true }
          )
    end
end