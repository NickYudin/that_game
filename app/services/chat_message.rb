class ChatMessage < ApplicationService
  def initialize(content)
    @chat = 1 # in future will need to select current chat
    @content = content
  end

  def call
    Message.create(chat_id: @chat, content: @content)
  end
end
