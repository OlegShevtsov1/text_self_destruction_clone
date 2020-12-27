RSpec.describe Messages::MessageToggleVisitService do
  describe '#call' do
    context 'when message is not visited' do
      let(:service) { described_class.new(message) }
      let(:message) { create(:message) }

      it 'returns true' do
        expect(service.call.class).to eq(TrueClass)
      end
    end

    context 'when message is visited' do
      let(:service) { described_class.new(message) }
      let(:message) { create(:message, :visited) }

      it 'returns nil' do
        expect(service.call.class).to eq(NilClass)
      end
    end
  end
end
