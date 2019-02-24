feature "Both of the players should enter their names." do
  scenario "When the players enete their names, the names are shown" do
    visit("/")
    fill_in :player_1_name, with: "farnaz"
    fill_in :player_2_name, with: "soroush"
    click_button "Submit"
    expect(page).to have_content "farnaz vs. soroush"
  end
end
