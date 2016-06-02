require 'rails_helper.rb'

feature 'Saving posts with invalid title' do
  it "Doesn't save posts with more than 21 characters even with a valid title" do
    visit 'posts/new'
    # Should not get saved when title has more than 20 characters.
    fill_in 'Title', with: "aaaaaaaaaaaaaaaaaaaaa"
    # Should be able to save contents between 3 and 140 characters.
    fill_in 'Content', with: "aaa"
    click_button "Create Post"
    visit 'posts'
      page.should_not have_content "aaaaaaaaaaaaaaaaaaaaa"
  end
  it "Does save posts with vaild title and content" do
    visit 'posts/new'
    # valid title with 9 characters should be saved.
    fill_in 'Title', with: "aaaaaaaaa"
    # Valid content with 3 characters should get saved.
    fill_in 'Content', with: "aaa"
    click_button "Create Post"
    visit '/posts'
    # Checking the saved post (should be saved)
    expect(page).to have_content "aaaaaaaaa"
    expect(page).to have_content "aaa"
    end
end
feature "Saving posts with invalid content" do
  it "Doesn't save posts with invalid content even with valid title" do
    visit '/posts/new'
    # 4 character title is a valid.
    fill_in 'Title', with: "aaaa"
    # 1 character title is not valid.
    fill_in 'Content', with: "a"
    click_button "Create Post"
    visit '/posts/'
    page.should_not have_content "aaaa"
   end
end
