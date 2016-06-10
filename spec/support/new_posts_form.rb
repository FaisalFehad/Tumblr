class NewPostsForm
  include Capybara::DSL

  def visit_new_post
    visit '/'
    click_on 'New Post'
    self
  end

  def fill_in_with(post_title_params ={})
    $post_title_params = post_title_params[:title]
    $post_content_params = 'Some valid content'
    fill_in('Title', with: post_title_params.fetch(:title, 'A test'))
    fill_in('Content', with: $post_content_params)
    self
  end

  def submit
    click_on('Create Post')
    self
  end

  def edit_post
    visit('/')
    click_on('Edit')
    fill_in 'Title', with:'Another title'
    click_on('Update Post')
  end
end
