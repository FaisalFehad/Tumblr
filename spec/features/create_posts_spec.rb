require 'rails_helper.rb'

feature 'Creating Posts' do
  scenario 'Can create post' do
    visit '/'
    click_link 'Create Post'
    fill_in 'Title', with: 'title'
    fill_in 'Content', with: 'post content'
    click_button 'Create'
    expect(page).to have_content 'title'
    expect(page).to have_content 'post content'
  end
end
