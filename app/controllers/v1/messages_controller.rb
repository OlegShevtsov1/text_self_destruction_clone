module V1
  class MessagesController < ApplicationController
    def create
      service = Messages::MessageCreateService.new(message_params).call
      if service.errors.empty?
        render json: MessageLinkSerializer.new(service).serializable_hash, status: :created
      else
        entity_error(:unprocessable_entity, service.errors)
      end
    end

    def show
      service = Messages::MessageToggleVisitService.new(message).call
      if service
        render json: MessageResponseSerializer.new(message).serializable_hash, status: :ok
      else
        render json: MessageRequestedSerializer.new(message).serializable_hash, status: :forbidden
      end
    end

    private

    def message
      @message ||= Message.find(params[:id])
    end

    def message_params
      params.permit(:description)
    end
  end
end
