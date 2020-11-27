class MessageForm
  include ActiveModel::Model

  MAX_SIZE = 100

  attr_accessor :message, :description

  validates :description, presence: true
  validates :description, length: { maximum: MAX_SIZE,
                                    message: I18n.t('validation.message.wrong_message_size', max_size: MAX_SIZE) }

  def initialize(message, params)
    @params = params
    @message = message
    self.attributes = params
  end

  def call
    return self unless valid?

    message.new_record? ? message.save : message.update(@params)
    message
  end
end
