RSpec.describe 'Messages', type: :request do
  include Docs::V1::Messages::Api

  describe 'POST #create' do
    include Docs::V1::Messages::Create

    context 'when success' do
      let(:post_message) { post v1_messages_path, params: params, as: :json }
      let(:params) { { description: FFaker::Lorem.word } }

      it 'create message', :dox do
        expect { post_message }.to change(Message, :count).from(0).to(1)
        expect(response).to be_created
      end
    end

    context 'when failed' do
      let(:params) { { description: '' } }

      before { post v1_messages_path, params: params, as: :json }

      it 'create project with wrong params', :dox do
        expect(response).to have_http_status :unprocessable_entity
      end
    end
  end

  describe 'GET #show' do
    include Docs::V1::Messages::Show

    context 'when record found' do
      let(:message) { create(:message) }

      before { get v1_message_path(message), as: :json }

      context 'when message was not requested before' do
        it 'returns status ok', :dox do
          expect(response).to have_http_status(:ok)
        end
      end

      context 'when message was requested before' do
        let(:message) { create(:message, :visited) }

        it 'returns status forbidden', :dox do
          expect(response).to have_http_status(:forbidden)
        end
      end
    end

    context 'when record not found' do
      let(:fail_message) { 1 }

      before { get v1_message_path(fail_message), as: :json }

      it 'returns status not_found', :dox do
        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
