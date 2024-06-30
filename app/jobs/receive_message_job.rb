class ReceiveMessageJob < ApplicationJob 
    def perform(conversation)
        conversation.receive_message.save
    end
end