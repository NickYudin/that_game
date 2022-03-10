require 'rails_helper'

RSpec.describe 'chats/index', type: :view do
  before do
    assign(:chats, [
             Chat.create!(
               name: 'Name'
             ),
             Chat.create!(
               name: 'Name'
             )
           ])
  end

  it 'renders a list of chats' do
    render
    assert_select 'tr>td', text: 'Name'.to_s, count: 2
  end
end
