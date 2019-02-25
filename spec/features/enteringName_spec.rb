feature "Both of the players should enter their names." do
  scenario "When the players enete their names, the names are shown" do
    visit("/")
    fill_in :player_1_name, with: "farnaz"
    fill_in :player_2_name, with: "soroush"
    click_button "Submit"
    expect(page).to have_content "farnaz vs. soroush"
  end

  scenario "When the start button is pushed, the first player movement is asked." do
    visit("/")
    fill_in :player_1_name, with: "farnaz"
    fill_in :player_2_name, with: "soroush"
    click_button "Submit"
    click_button "Start_game"
    expect(page).to have_content "farnaz please enter your movement."
  end
end
