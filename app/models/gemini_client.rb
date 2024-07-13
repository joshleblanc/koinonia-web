class GeminiClient
    delegate_missing_to :client 

    attr_reader :client 
    
    def initialize(key:)
      @client = Gemini.new(
        credentials: {
          service: 'generative-language-api',
          api_key: key
        },
        options: { model: 'gemini-1.5-flash', server_sent_events: true }
      ).tap do |klass|
        klass.define_singleton_method(:count_tokens) do |payload|
          result = request(
            "#{@model_address}:countTokens", 
            payload,
            server_sent_events: true
          )

          return result.first if result.is_a?(Array) && result.size == 1

          result
        end
      end
    end

    def self.instance 
        @instance ||= new(key: Rails.application.credentials[:google][:key])
    end
end