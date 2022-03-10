require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe '/chats', type: :request do
  # Chat. As you add validations to Chat, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    skip('Add a hash of attributes valid for your model')
  end

  let(:invalid_attributes) do
    skip('Add a hash of attributes invalid for your model')
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      Chat.create! valid_attributes
      get chats_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      chat = Chat.create! valid_attributes
      get chat_url(chat)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_chat_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'render a successful response' do
      chat = Chat.create! valid_attributes
      get edit_chat_url(chat)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Chat' do
        expect do
          post chats_url, params: { chat: valid_attributes }
        end.to change(Chat, :count).by(1)
      end

      it 'redirects to the created chat' do
        post chats_url, params: { chat: valid_attributes }
        expect(response).to redirect_to(chat_url(Chat.last))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Chat' do
        expect do
          post chats_url, params: { chat: invalid_attributes }
        end.to change(Chat, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post chats_url, params: { chat: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        skip('Add a hash of attributes valid for your model')
      end

      it 'updates the requested chat' do
        chat = Chat.create! valid_attributes
        patch chat_url(chat), params: { chat: new_attributes }
        chat.reload
        skip('Add assertions for updated state')
      end

      it 'redirects to the chat' do
        chat = Chat.create! valid_attributes
        patch chat_url(chat), params: { chat: new_attributes }
        chat.reload
        expect(response).to redirect_to(chat_url(chat))
      end
    end

    context 'with invalid parameters' do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        chat = Chat.create! valid_attributes
        patch chat_url(chat), params: { chat: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested chat' do
      chat = Chat.create! valid_attributes
      expect do
        delete chat_url(chat)
      end.to change(Chat, :count).by(-1)
    end

    it 'redirects to the chats list' do
      chat = Chat.create! valid_attributes
      delete chat_url(chat)
      expect(response).to redirect_to(chats_url)
    end
  end
end
