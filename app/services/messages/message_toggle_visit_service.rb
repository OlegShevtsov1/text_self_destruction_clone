module Messages
  class MessageToggleVisitService
    attr_reader :message

    def initialize(message)
      @message = message
    end

    def call
      return if message.visit

      message_requested(Rails.configuration.visit)
    end

    private

    def message_requested(method)
      message.toggle method
      message.save
    end
  end
end
