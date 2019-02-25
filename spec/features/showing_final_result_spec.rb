feature "It shows the final resual in a good way" do
  scenario "scissors wins the paper movement" do
    visit "/"
    fill_in :player_1_name, with: "soroush"
    fill_in :player_2_name, with: "farnsz"
    click_button "Submit"
    click_button "Start_game"
    select "scissors", :from => "player_1_movement"
    click_button "Submit"
    select "paper", :from => "player_2_movement"
    click_button "Submit"
    expect(page).to have_content "soroush won the game"
  end

  scenario "the game is equal when both the movements are same" do
    visit "/"
    fill_in :player_1_name, with: "soroush"
    fill_in :player_2_name, with: "farnsz"
    click_button "Submit"
    click_button "Start_game"
    select "scissors", :from => "player_1_movement"
    click_button "Submit"
    select "scissors", :from => "player_2_movement"
    click_button "Submit"
    expect(page).to have_content "The game is equal"
  end
end
