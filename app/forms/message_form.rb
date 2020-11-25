class MessageForm
  include ActiveModel::Model

  MAX_SIZE = 100

  attr_accessor :description

  validates :description, presence: true
  validates :description, length: { maximum: MAX_SIZE,
                                    message: I18n.t('validation.message.wrong_message_size', max_size: MAX_SIZE) }

  def save
    return unless valid?

    Message.create(description: description)
  end
end
