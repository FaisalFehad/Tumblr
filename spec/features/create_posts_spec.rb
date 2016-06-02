require 'rails_helper.rb'

feature 'Creating and view posts' do
  scenario 'Can create post' do
    visit '/posts/new'
    expect(page).to have_content 'Create a new post'
    fill_in 'Title', with: 'title'
    fill_in 'Content', with: 'post content'
    click_button 'Create'
    expect(page).to have_content 'title'
    expect(page).to have_content 'post content'
    expect(page).to have_content "less than a minute"
    visit '/'
    # the heading of the page
    expect(page).to have_content 'Posts'
    expect(page).to have_content 'post content'
    expect(page).to have_content 'title'
  end
end
