module Messages
  class MessageToggleVisitService
    attr_reader :message

    def initialize(message)
      @message = message
    end

    def call
      return if message.visit

      message_requested
    end

    private

    def message_requested
      message.toggle :visit
      message.save
    end
  end
end
