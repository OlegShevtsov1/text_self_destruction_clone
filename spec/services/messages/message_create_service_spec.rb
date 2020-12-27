RSpec.describe Messages::MessageCreateService do
  describe '#call' do
    context 'when params is valid' do
      let(:service) { described_class.new(params) }
      let(:valid_params) { { description: FFaker::Lorem.word } }
      let(:params) { ActionController::Parameters.new(valid_params).permit(:description) }

      it 'returns Message object' do
        expect(service.call.class).to eq(Message)
      end

      it 'creates new message' do
        expect { service.call }.to change(Message, :count).from(0).to(1)
      end
    end

    context 'when params is invalid' do
      let(:service) { described_class.new(params) }
      let(:invalid_params) { { message: { description: '' } } }
      let(:params) { ActionController::Parameters.new(invalid_params).permit(:description) }

      it 'returns MessageForm' do
        expect(service.call.class).to eq(MessageForm)
      end

      it 'does not create new message' do
        expect { service.call }.not_to change(Message, :count)
      end
    end
  end
end
