require "application_system_test_case"

class MatchesTest < ApplicationSystemTestCase
  setup do
    @match = matches(:one)
  end

  test "visiting the index" do
    visit matches_url
    assert_selector "h1", text: "Matches"
  end

  test "should create match" do
    visit matches_url
    click_on "New match"

    fill_in "Last", with: @match.last_id
    fill_in "Runner up", with: @match.runner_up_id
    fill_in "Second runner up", with: @match.second_runner_up_id
    fill_in "Winner", with: @match.winner_id
    click_on "Create Match"

    assert_text "Match was successfully created"
    click_on "Back"
  end

  test "should update Match" do
    visit match_url(@match)
    click_on "Edit this match", match: :first

    fill_in "Last", with: @match.last_id
    fill_in "Runner up", with: @match.runner_up_id
    fill_in "Second runner up", with: @match.second_runner_up_id
    fill_in "Winner", with: @match.winner_id
    click_on "Update Match"

    assert_text "Match was successfully updated"
    click_on "Back"
  end

  test "should destroy Match" do
    visit match_url(@match)
    click_on "Destroy this match", match: :first

    assert_text "Match was successfully destroyed"
  end
end
