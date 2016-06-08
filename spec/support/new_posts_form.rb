class NewPostsForm
  include Capybara::DSL

  def visit_root_page
    visit '/'
    click_on 'New Post'
    self
  end

  def fill_in_with(option ={})
    fill_in('Title', with: option.fetch(:title, 'A test'))
    fill_in('Content', with: 'Some valid content')
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
