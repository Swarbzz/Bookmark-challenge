feature 'View bookmarks' do
  scenario 'One can view their bookmarks' do
    visit '/'
    click_button 'View Bookmarks'
    expect(page).to have_content 'Bookmarks'
  end
end