require 'rails_helper'

RSpec.describe "Rooms", type: :request do
  # describe "GET /index" do
  #   get :index
  #   assert_response :success
  # end


  context "functionality test" do
    current_user = User.first_or_create!(email: 'metalworldowner@gmail.com', password: 123456, role_id: 1)

    rooms = Room.create!([{description: 'some room', monster_id: 1}, {description: 'another room', monster_id: 2}])

    it "shoud save last visited room" do
    3.times {Room.new(description: "some room #{rand(1..123).to_s}").save}
#need to login first!!

      get room_path(2)
      expect(current_user.last_room).to eq(2)
    end

  end
end
