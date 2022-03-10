require 'rails_helper'

RSpec.describe 'chats/show', type: :view do
  before do
    @chat = assign(:chat, Chat.create!(
                            name: 'Name'
                          ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
  end
end
