require 'rails_helper.rb'
  feature "Delte and edit posts" do
    def make_a_post_with(options={})
      options[:title] ||= "Valid title"
      options[:content] ||= "Valid content"

      visit '/posts/new'
      fill_in 'Title', with: options[:title]
      fill_in 'Content', with: options[:content]
      click_button 'Create Post'
    end

    it 'makes posts' do
      make_a_post_with title: 'Cool thing'
      make_a_post_with content: 'Some post contents'

      expect(page).to have_text :title
      expect(page).to have_text :content
      expect(page).to have_link "Edit"
      expect(page).to have_link "Delete"
  end
# failing tests
  it 'edits posts' do
    visit '/'
    within "#post#{post.id}" do
      click_link 'Edit'
    end
    fill_in 'Title' with: 'foo'
    fill_in 'Content' with: 'barrrr'
    click_button 'Update Post'
    #Check the edited post
    visit '/'
    expect(page).to have_text 'foo'
    expect(page).to have_text 'barrrr'
    expect(page).to have_text "minutes"
  end

  it 'deletes posts' do
    visit '/'
    within "#post#{post.id}" do
      click_link 'Delete'
    end
    expect(page).to have_text 'Are you sure?'
    click_button 'Yes'
    #Check the deleted post
    visit '/'
    expect(page).to_not have_text 'foo'
    expect(page).to_not have_text 'barrrr'
    end
  end
end
