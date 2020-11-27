module Messages
  class MessageCreateService
    attr_reader :params

    def initialize(params)
      @params = params
    end

    def call
      message = Message.new(params)
      MessageForm.new(message, params).call
    end
  end
end
