require 'rails_helper'

feature 'leave a note on post' do
  let(:new_posts_form) {NewPostsForm.new}

  scenario 'Create a post and comment on it' do
    #create a post
    new_posts_form.visit_root_page.fill_in_with(
    title: 'foobaz'
    ).submit
    # find the post and view it and leave a comment in the post
    visit('/')
    click_link 'foobaz'
    fill_in 'User name', with: 'Fobar'
    fill_in 'Comment Content', with: 'Some text'
  end
end
