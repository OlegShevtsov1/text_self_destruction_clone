class MessageRequestedSerializer
  include JSONAPI::Serializer

  attribute :message do
    I18n.t('serializer.request.already_requested').to_s
  end
end
