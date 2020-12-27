class MessageLinkSerializer
  include JSONAPI::Serializer

  link :url do |object|
    "v1/messages/#{object.id}"
  end
end
