class ChatMessage < ApplicationService

  def initialize(chat, content)
    @chat = chat
    @content = content
  end


  def call
    Message.create( chat_id: @chat, content: @content)
  end

end