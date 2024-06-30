class ReceiveMessageJob < ApplicationJob 
    def perform(conversation)
        conversation.receive_message!
    end
end