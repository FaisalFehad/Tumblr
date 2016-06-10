class NewCommentsForm
  include Capybara::DSL

  def open_a_post
    visit('/')
    # click on the post title that spesifed on spec sheet if not it will take
    #the default value in the method in NewPostsForm.fill_in_with
    click_link $post_title_params
    fill_in 'User name', with: 'Fobar'
    fill_in 'Comment Content', with: 'Some text'
  end
end
