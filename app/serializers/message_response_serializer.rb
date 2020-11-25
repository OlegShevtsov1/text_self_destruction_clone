class MessageResponseSerializer
  include JSONAPI::Serializer

  attribute :message, &:description
end
