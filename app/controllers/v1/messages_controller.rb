module V1
  class MessagesController < ApplicationController
    def create
      message_form = MessageForm.new(message_params)
      message = message_form.save
      if message
        render json: MessageLinkSerializer.new(message).serializable_hash, status: :created
      else
        entity_error(:unprocessable_entity, message_form.errors)
      end
    end

    def show
      if message.visit
        render json: MessageRequestedSerializer.new(message).serializable_hash, status: :forbidden
      else
        render json: MessageRequestService.new(message).call, status: :ok
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
