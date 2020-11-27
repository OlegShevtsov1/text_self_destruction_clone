module Messages
  class MessageShowService
    attr_reader :message

    def initialize(message)
      @message = message
    end

    def call
      message_requested
      MessageResponseSerializer.new(message).serializable_hash.merge({ status: :ok })
    end

    private

    def message_requested
      message.toggle :visit
      message.save
    end
  end
end
