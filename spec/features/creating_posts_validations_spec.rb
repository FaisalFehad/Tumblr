require 'rails_helper.rb'

feature 'Save valid posts only' do
  def attempt_to_post_with (options={})
    options[:title] ||= "My valid post"
    options[:content] ||= 'My valid post content'
    visit '/posts/new'
    fill_in 'Title', with: options[:title]
    fill_in 'Content', with: options[:content]
    click_button "Create Post"
    visit '/posts/'
  end

char = 'a'

  it "Doesn't save posts with more than 21 characters " do
    attempt_to_post_with title: (char *22)
    attempt_to_post_with content: (char *15)
    expect(page).not_to have_content (char *22)
  end

  it "Does save posts with vaild title and content" do
    attempt_to_post_with title: (char *8)
    attempt_to_post_with content: (char *25)
    expect(page).to have_content (char *8)
    expect(page).to have_content (char *8)
    end

   it "Doesn't save posts with invalid content even with valid title" do
     visit '/posts/new'
     fill_in 'Title', with: (char *4)
     fill_in 'Content', with: "a"
     click_button "Create Post"
     visit '/posts/'
     page.should_not have_content (char *4)
    end
end
