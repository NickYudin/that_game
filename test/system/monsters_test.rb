require "application_system_test_case"

class MonstersTest < ApplicationSystemTestCase
  setup do
    @monster = monsters(:one)
  end

  test "visiting the index" do
    visit monsters_url
    assert_selector "h1", text: "Monsters"
  end

  test "should create monster" do
    visit monsters_url
    click_on "New monster"

    fill_in "Name", with: @monster.name
    fill_in "Power", with: @monster.power
    click_on "Create Monster"

    assert_text "Monster was successfully created"
    click_on "Back"
  end

  test "should update Monster" do
    visit monster_url(@monster)
    click_on "Edit this monster", match: :first

    fill_in "Name", with: @monster.name
    fill_in "Power", with: @monster.power
    click_on "Update Monster"

    assert_text "Monster was successfully updated"
    click_on "Back"
  end

  test "should destroy Monster" do
    visit monster_url(@monster)
    click_on "Destroy this monster", match: :first

    assert_text "Monster was successfully destroyed"
  end
end
