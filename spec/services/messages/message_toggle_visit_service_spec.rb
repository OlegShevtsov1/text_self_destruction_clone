RSpec.describe Messages::MessageToggleVisitService do
  describe '#call' do
    context 'when message is not visited' do
      subject(:call) { described_class.new(message).call }

      let(:service) { described_class.new(message) }
      let(:message) { create(:message) }
      let(:configuration) { instance_double('Configuration', visit: :visit) }

      before do
        allow(Rails).to receive(:configuration).and_return(configuration)

        call
      end

      # it 'returns true' do
      # expect(service.call.class).to eq(TrueClass)
      # end

      it { expect(configuration).to have_received(:visit) }

      # it 'demonstrates doubles' do
      #   binding.pry
      # end
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

# RSpec.describe Messages::MessageToggleVisitService do
#   describe '#call' do
#     context 'when message is not visited' do
#       subject { described_class.new(message).call }
#
#       let(:service) { described_class.new(message) }
#       let(:message) { create(:message) }
#       let(:configuration) { double(visit: :visit) }
#
#       before do
#         allow(Rails).to receive(:configuration).and_return(configuration)
#
#         subject
#       end
#
#       # it 'returns true' do
#       # expect(service.call.class).to eq(TrueClass)
#       # end
#
#       it { expect(configuration).to have_received(:visit) }
#     end
#
#     context 'when message is visited' do
#       let(:service) { described_class.new(message) }
#       let(:message) { create(:message, :visited) }
#
#       it 'returns nil' do
#         expect(service.call.class).to eq(NilClass)
#       end
#     end
#   end
# end
