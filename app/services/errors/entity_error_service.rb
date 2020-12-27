module Errors
  class EntityErrorService
    attr_reader :status, :errors

    def initialize(status, errors)
      @status = status
      @errors = errors
    end

    def serializable_hash
      errors.messages.map do |attribute, message|
        {
          source: { pointer: "data/attributes/#{attribute}" },
          detail: message
        }
      end
    end
  end
end
