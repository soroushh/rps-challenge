feature "The names of players is aksed in the first page." do
  scenario "Both of players should enter their names in the required areas." do
    visit "/"
    expect(page).to have_content "Please enter your names."
  end
end
